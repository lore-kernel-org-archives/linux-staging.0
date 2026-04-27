Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961E0311C1D
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 16:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305782; cv=none; b=GjymJPLGgMzDL3xxIeknNruBjC2HhJjURF0iEGEv5yHFhN86D29ONxqho0WLrVAW15AHer17qiD/3gbBNpnhS6hDR1V6IUbIUidQ93edJhTQ8W70iNy0ioNGa0Hzj2EmrEaZCsIDoBlWgr1ckuW3FbixBzet7cC9IXNf3ikASQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305782; c=relaxed/simple;
	bh=CSiHW7PcKiD+ZgGgGOpBNTZ3Rn/+ZVx47WuXp1Aul0E=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=sYCfRKiSBUFqraFY0J4cTPG57VYFWD2aFEP1Vr19MA21lDBn5FGVE57PAaei+Auusn6fhFNFE0ThPSK+xx0GjpCL+QhBOHUIPvbq56cJ4mMO+nYWBYDb/BcGNBFJIhtrPWWs3ia7oPJKhjMNZwupCIXhV6JwwyAxs+bcbFhNcm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BIbXnuEE; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BIbXnuEE"
Date: Mon, 27 Apr 2026 18:02:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777305778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hB1vrM0UOaBs6BiqP9k7zX4+ywBWRmd2+i/jg13Jfg8=;
	b=BIbXnuEE7dGligH3LhHeOua3lpbpzBeNRZwnacuMv7MxUweETZRK8asw5rTOmg5yEWo0xO
	9G/qcPA9rYJXwdl3G8mn+ith3if2fVQTZQRUXXl1oCyhzF16bZSS/Q/T2efLHMYoo6zV+r
	VFG923S4jOondewp6yXFoKPu1JeB3AM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Salman Alghamdi <me@cipherat.com>, Dan Carpenter <error27@gmail.com>
CC: gregkh@linuxfoundation.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/5=5D_staging=3A_rtl8723bs=3A_r?=
 =?US-ASCII?Q?tw=5Fmlme=3A_fix_lines_exceeding_100__columns?=
In-Reply-To: <5d82ba44-eba0-0d0d-4cdf-fe58a3e6cb75@cipherat.com>
References: <20260426225552.87114-1-me@cipherat.com> <20260426225552.87114-3-me@cipherat.com> <ae8oIMM08ntVQFdO@stanley.mountain> <5d82ba44-eba0-0d0d-4cdf-fe58a3e6cb75@cipherat.com>
Message-ID: <A349D267-DE13-469C-A92B-347A2E81D5F0@linux.dev>
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

On April 27, 2026 5:46:34 PM GMT+02:00, Salman Alghamdi <me@cipherat=2Ecom>=
 wrote:
>On April 27, 2026 12:10 +03, Dan Carpenter <error27@gmail=2Ecom> wrote:
>
>> This patch is too big and too complicated=2E  If you send a patch that
>> only adds newlines, then I have automated ways to review that but
>> when you're adding variables and change code to use min_t() then
>> it's hard to review=2E
>
>The introduction of some variables was made in order to fix line
>length for certain function calls that has long named parameters=2E
>Should I separate long line fixes into two patches, one only for
>simple newlines and the other that introduces variables?

Yes, that could work=2E

>
>> When you start doing things which are more complicated than
>> just adding newlines, then it gets controversial in ways you
>> don't expect=2E  For example, we don't really use min_t() these
>> days=2E
>
>I tried using min() first as Luka noted me, but checkpatch=2Epl warned
>to replace it with min_t() instead=2E What is the preferred function
>to use in this case?

You could use umin() since both of these are unsigned, but check that=20
just in case=2E

>
>Regards,
>Salman Alghamdi
>
Best regards,
Luka Gejak
