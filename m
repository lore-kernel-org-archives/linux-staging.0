Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A0A22ACEB
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 16:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777913316; cv=none; b=eULA9FBui1drEhXdhkR5mL3X5UufGfLSXd9q3RB5zipfX0soM3HnvO6wUOK6Mivtn18vIHlwmXVc44kz+mNhg5t5uf1696/GE4Ye4q7nfxqv5DFipK1tVxbVieJiPThgs6GIV7LzLhjK4poTyo2UgUWjvzoHPWcBv0gSrPg1rsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777913316; c=relaxed/simple;
	bh=GWq0yfjmV1xz9YNGL1RbVnlQ2R5Ai4KdNScNgP+4bco=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ZRC5MvlrmwMVnFgqWs65Faa6pZROCocXeMUvs/vVHTeNVmToW46hhIm491HbZe4Ozx9o0z6J1XwtJXnjOxQCz/dPOKoB25ttKf48YgNA20Y5pV8zFzPgWylruzonZc8YxIr8KHcJt9FrNSstZQrUsiWhR4Yv4v2wCInn2A79o3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=i9FcFhyZ; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="i9FcFhyZ"
Date: Mon, 04 May 2026 18:48:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777913311;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5BwzgSdCRKq677PYNLuul7DfsefkneOrh3lBdxZDCcM=;
	b=i9FcFhyZz1ddqgNLSkj21CRP9Cbb94YK/vNEKxad8eZpbrSxM3xS74RQJh5okxg7EDmIhb
	uz/9gEdWE7L4zxQh9LD79ubTMtzKoBWfI0YtrNIW6RuMzdCostKp9Ndt++WIVpI+jwax/n
	sHMGovAv/KllmkjosOHh8+YaPwtwpwc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Greg KH <gregkh@linuxfoundation.org>, Feng Ning <feng@innora.ai>
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v6=5D_staging=3A_rtl8723bs=3A_fix_hea?=
 =?US-ASCII?Q?p_buffer_overflow_in_cfg80211=5Frtw=5Fadd=5Fkey=28=29?=
In-Reply-To: <2026050417-monkhood-backless-4c3e@gregkh>
References: <20260413113224.5201-1-feng@innora.ai> <2026042626-tabloid-suitor-33c5@gregkh> <20260427111738.33069-1-feng@innora.ai> <2026050417-monkhood-backless-4c3e@gregkh>
Message-ID: <5035183D-9CC0-4D2F-90CA-3AA2B5AC480A@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On May 4, 2026 4:12:44 PM GMT+02:00, Greg KH <gregkh@linuxfoundation=2Eorg>=
 wrote:
>On Mon, Apr 27, 2026 at 11:17:45AM +0000, Feng Ning wrote:
>> The cfg80211 framework allows userspace to specify a key sequence
>> counter (NL80211_KEY_SEQ) of up to 16 bytes via NL80211_CMD_NEW_KEY
>> netlink messages, but ieee_param=2Ecrypt=2Eseq is a fixed 8-byte buffer=
=2E
>> When cfg80211_rtw_add_key() copies the sequence counter via memcpy()
>> without checking seq_len, a heap buffer overflow of up to 8 bytes
>> occurs, overwriting bytes following seq within the same ieee_param
>> structure (key_len and the trailing key[] flexible array)=2E
>>=20
>> Cap the copy length at the buffer size using min_t()=2E
>>=20
>> Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
>> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
>> Cc: stable@vger=2Ekernel=2Eorg
>> Signed-off-by: Feng Ning <feng@innora=2Eai>
>> ---
>
>What about these review comments:
>	https://sashiko=2Edev/#/patchset/20260427111738=2E33069-1-feng@innora=2E=
ai
>
>Are they incorrect?
>
>And was this tested on real hardware?
>
>thanks,
>
>greg k-h

Hi Greg,
Is it better to let the driver attempt to function with a truncated=20
key sequence (via min_t), or should we explicitly reject the request=20
with -EINVAL to ensure we aren't installing a technically "broken" key
configuration? Which approach is more aligned with your preferences?
Best regards,
Luka Gejak
