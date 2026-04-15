Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E47B14AD20
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 05:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776230344; cv=none; b=pGL/xsSibd3YZb/lkZdIASXyZMkixM+1jW0m/Q5BmCjoPgGt/M1ErxwfNbapeTo4MAVeozHix0ZS/kWeyLbKmOuptKd2qN+dkyNPWQU1C/Qg+/sQuBgm6CHo8KPvKYxH/cU2CsPbbm0KQyQIQpKbQ9ULIga9YjEsOv9PYHa/9Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776230344; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 In-Reply-To; b=GjPLOwjxYCSea1+bvcRBzuOnPkJE90xuIMK3DnKdPkQCrkZXSUuHMzh6Qiozm6+PWjVGAuvgvlfuwop77TiYOm/ITi3AO8ZHoAvVd0Unr9M2OwPD4xmn5Tk5lh9UH5EqaiftF5mRTZ1yPA+D4Zt4/HnBHipcF3k2YHnLun8+zCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LycqxEl1; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LycqxEl1"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776230341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=LycqxEl1L4mLli4s7IZRv9w5gruiadYZJrYcSYfnvQCFjs31KcunCvLNVLUlhH/EEKVVod
	5MOBnLi7B4aFv+UGRIGF6PfzOEpD4i3gGghRL/8CT1g7rNZli80B+xT4ScBjq8jsCFubQy
	RikUkMXCxFXxVx0pdJkwxoBMwi+80NQ=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 07:18:51 +0200
Message-Id: <DHTH3PLMFNK6.24NLM1U01XPKJ@linux.dev>
Subject: Re: [PATCH v2] staging: rtl8723bs: fix missing frame length checks
 in OnAuthClient
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: <gregkh@linuxfoundation.org>
Cc: <error27@gmail.com>, <hossu.alexandru@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <stable@vger.kernel.org>
In-Reply-To: <2026041526-resonate-overpower-e45f@gregkh>
X-Migadu-Flow: FLOW_OUT

