Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E522B371CE1
	for <linux-staging@lists.linux.dev>; Sat, 18 Apr 2026 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776499138; cv=pass; b=d22A2B3r2RP62si3A9yPe5OroxUKXqmqgsfLHJagIImAURFTqRiRIfyx7khZi3kTEt5+nErMS8aKQ4YfChwk6ewpiqKn5pHBIbhzOWfdAYJKopCABk2IUV1dhYh0oP1XSd5Yu1ezjIb59kfCVZqRB2Q24lRo8X+Md1DRzLxh+7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776499138; c=relaxed/simple;
	bh=oeJabYoyme4rE/G+I0nP/zUwd2uCLgMtpSQuiFcQIto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvCIjsa3BurULHGqbocAcX+vsU9KDvePMkltJwUQfO8La8zwSbe//BKKdyZO6vjrvG0JJ+rQJHsL6a+rXGzl98zZqmG9SNuSk+v/Rlwuf+IZFduWolNhg2Xd5VTbtyKy+AKP/uYBE405CsQMLEW5cBzobCiQ8ePYx2yQDysNsKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=FE/IQyWf; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="FE/IQyWf"
Received: from hillosipuli.retiisi.eu (n18ws8cotq5gnfn8-1.v6.elisa-laajakaista.fi [IPv6:2001:99a:0:19f:4ce7:0:938c:d2f4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4fyPJl3CYHzyR8;
	Sat, 18 Apr 2026 10:58:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1776499128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X00w4i5D0ZnZKexaVFWAV0cqBlMwkVcbaN9RQWznw5M=;
	b=FE/IQyWfwHb0LKTUsXuMbeQDEUYQJrbQkelZzd95MqEybbupXqyMUiljJjDoheqFU/q6mM
	fgqNSBxYBaNWKCROa74MK4GqQd9/XXpcXXVgwHOEpUgiXHQxK/MCjt6MUJTMYruZIn9loO
	W/LCBaQesRnUrqEjcqDrd5yRz4NPtoI=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1776499128;
	b=g5F8TqRjAyC4ENkrHBdpsPt+6Cqso9uZ3tiP6jeXhEFYUSFvKUXAPYSje0ZULMlLS1fnJk
	oghHMOIcIvUNK/66TH7yrgQ37Hg0Vpu8pls/+y7zMe5FnL/tBO2BwbhD2rQiHeN2UkSzwD
	v3GPZkTXBdNX3hmroMC0K/jKgoQf2Oo=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1776499128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X00w4i5D0ZnZKexaVFWAV0cqBlMwkVcbaN9RQWznw5M=;
	b=URNtM/qEBhkKk/6/C8e8wMb595g54APoJi6M4olniCaOnZehA6TEXJf/vy+aYwxMkdNN76
	diSQjKrNw7bMPhGMHWR6NHUtaZDaELeIy8j1Jb59To1LkMOaKofba+dif4Jwnh159CQrhQ
	kIuXrxFHMoS8WyoE6Bfz9Vw075LlxOM=
Received: from valkosipuli.retiisi.eu (valkosipuli.local [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id CC848634C4E;
	Sat, 18 Apr 2026 10:58:46 +0300 (EEST)
Date: Sat, 18 Apr 2026 10:58:46 +0300
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mohammed EL Kadiri <med08elkadiri@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v3] media: atomisp: fix spelling mistake
Message-ID: <aeM5tm4wotNcFGZ0@valkosipuli.retiisi.eu>
References: <20260323141729.27701-1-med08elkadiri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323141729.27701-1-med08elkadiri@gmail.com>

Hi Mohammed,

On Mon, Mar 23, 2026 at 03:17:29PM +0100, Mohammed EL Kadiri wrote:
> Run codespell on the entire atomisp driver and fix various typos to improve
> code readability and searchability.
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Mohammed EL Kadiri <med08elkadiri@gmail.com>

I'm afraid this no longer applies to my atomisp branch.

-- 
Kind regards,

Sakari Ailus
