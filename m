Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D38F81732
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 18:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778436261; cv=none; b=lJNYhYGNcidzyNHSISmpkVUH6gLKeatYB/b8QoLEwHaEzmOFL/QP+ChaCTLjYmcWt7s5GpbCq5zDZJeAVhpez1+VUPDZWjQmT6LHbs2u02ZYEkF0K9uwauEPqaNgjy+dYQkKO+WkNvvG1R4inHRtC2tfRWjOKvBTQFLzwi/rkNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778436261; c=relaxed/simple;
	bh=oe00AWRMQfXHYNWW9ZSABS9GAxmb3dt4LL/VVPcYbh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFmoJpRBXEndisc+D3c6sDx541IFoLRlsmvdBfL1pKgvVn2KqIRRWafHbi9Vb8FBe/sfJlAtNx1iuzxBmLWo4DoHoHnioetqmASmKW7LnuiiPmqwBU5fnhXYWQwsZXNWGTRNy5/flq5tXx/OmHx8K3G+ffxElhT89rauAD1K3dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFKvSrGr; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFKvSrGr"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39389398838so31009721fa.3
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 11:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778436259; x=1779041059; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zECqdpxJmkdrtiw+apZjsqGKv8xquZC5BZYUrqRbj+4=;
        b=QFKvSrGrDc+mQZkeVg/9GIjH+rQYTMYV/iB9oSK+BWsXtNW7SQk7c+J0oRxOsKKJqr
         nlSwcIG1B3g17jtXg4NKWw2ExHtw7IrmTP9g49Dgz3Sv7XvXDAhU+nzaMt2y5UV/c2NF
         GwXEJXyRh+FIbu2BOzLHvX+NfKMuoIIkj6lUj6u1MNzPWGO8kBSU0GJNNdcUv5JZ1bwS
         xBgLp6G0ZCaaKbMeaY+v8S2Xk6jn0v8XXy7AEiC3lL7UJwmQkARg4ngFI5f1KSPdyLMS
         PRtUSO0P0v0g1Z3BELTXHyqeea1+sZ3oCmUONEAML8ftNdfNxxjsMLJbkkk6n7mkHF4u
         8bdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778436259; x=1779041059;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zECqdpxJmkdrtiw+apZjsqGKv8xquZC5BZYUrqRbj+4=;
        b=X0t9Ej1yR2Uyb4+0Zfoh6+vmpDsvILh2MvkdBXIeLUCRJWybSADAk0qSjo+Vvtojdi
         XpkVymdRa+IahsAcPoXMgt90ybBYYvRn2WwDV5fgpUKkib+t9R71G3TRcwqocLBhtkjt
         N2A4B/EyTgSuCAkYJTK1R6l4ok+jRprwL1i2+FqaQrZ3voRFk/St5V2D7BpEM5sa3aPj
         0IdZnfumsSa0gq8R1B/Q5VF1eAncsJdWgOohwAb1YYS+of9iBRtthKb+ujnRqUfLvMq1
         NmFiH9Dar5wGR8vivqhfUaqG81dKrxMJCbuFQ1UBCH5Muj6VPR1cGtrayob+QWAfZQ56
         YNkw==
X-Forwarded-Encrypted: i=1; AFNElJ8xcSO7vETzT+L5J4OBfjP+LBbXhXFhoU+wo9cpgGcy0ckfzErgOAkSN7SSuN09Y+pAjUuTiZioCOSEPOEU@lists.linux.dev
X-Gm-Message-State: AOJu0YyTOAnGkBbqQWFEWHKE9BkgvhuRwVYYEVcrlwHk3dmWhJyPm8ps
	jC2fc8BRHRqMMp4h9Ivkho37f7AijJAs42GMGU3GQZz8gN89kabRMCTF
X-Gm-Gg: Acq92OGd1uOSNLqXMAuaKiEQR8rnWlB0sJHQh9mKdnWRVmQAJVqv8qLZSR8KP4XoheK
	1hD2BrSD3m2T+G1snDX6r6jWfFepRmS8UN6IfH5WYTr+vtV3SAvgoafZjO3pYbX3c03ix713WFN
	VpTM6gHMgTmeOb1gS6LrxUwnLT4SMWaD/pX8Wp2MeCoecMJWpyv36UPuJDM0DxeMwREWqB/0ZjD
	gbVWEBfvV7hfmAnZLTHlQhQt445hpd9/V8+rgKQtxKXdQuzPlpli+hq2lS8/uIJ9XYQHwDxwHl7
	jLy48mQmwAbxNxgiz2qVYbgDrLAChThJcdlq1crgf0ed6Hwkn5ss1yO2YcpzyhQFg9K/wxc3ij0
	CKGNsfped/P57YhoQdOkb1zbTq58gRaP08kj9eEqW/GnqD7+UvyCH7mVSDwyNtfLWE08evSqIcp
	2xoatIH97GyLX3Shzj+qqlIcNz5VwFhJYTwIU=
X-Received: by 2002:a2e:9092:0:b0:38f:e999:6a5a with SMTP id 38308e7fff4ca-393c4111cb5mr63426151fa.11.1778436258664;
        Sun, 10 May 2026 11:04:18 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6144071sm19491431fa.32.2026.05.10.11.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 11:04:18 -0700 (PDT)
Date: Sun, 10 May 2026 21:04:14 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: PRAMOD MAURYA <pramod.nexgen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>
Subject: Re: [PATCH] staging: rtl8723bs: Fix coding style in ieee80211.h
Message-ID: <agDInsLI8UV7LdhV@archlinux>
References: <20260510110228.96612-1-pramod.nexgen@gmail.com>
 <agC1-rqon7nRUdvM@archlinux>
 <CAKR_b74W78QpNKvF_bU1EfT0WhXq4GxQDJiQ05Z454eABRsYWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKR_b74W78QpNKvF_bU1EfT0WhXq4GxQDJiQ05Z454eABRsYWA@mail.gmail.com>

On Sun, May 10, 2026 at 10:48:22PM +0530, PRAMOD MAURYA wrote:
> Hi Nikolay,
> 
> Thanks for the review.
> 
> Understood. I’ll split the changes into separate logical patches and keep
> future submissions more focused.
> 
> The Cc list was generated using get_maintainer.pl. I’ll review it more
> carefully before sending the next revision.

Run this script with the '--nogit-fallback' flag, it will not output the
developers who modified this file, only the maintainer and mailing
lists.

And always wait some time (1 day) before submitting a new version, no
need to rush.


> > Thanks,
> > Nikolay
