Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0D426A095
	for <linux-staging@lists.linux.dev>; Tue, 25 Feb 2025 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740491831; cv=none; b=dpeM3MeBLCnIDs/mYxTfcNIURGjQcLxntWlR4RvABaoc5L6KNi8G+Seau9Fkp//NqjO09xT5KTVFDutKo9Vtr5myzhMlkpTa2mRxEJWHUFugZWW4tkxXR1BkGAK+iucy/lg3Z97ZEIPaVYf2v3gdHE4lhReHh4aPydmYirsBGeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740491831; c=relaxed/simple;
	bh=jNkGx7KXDIGaHcJ2rYwzogZr3XWTs6dGfkVUk/mbr2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2BsOiepxX+MrRHCZG9uCggiH3p/Ns1WJNQUTPM+tPL2FIMRYLQXbRn+gKJn5boO5mlrqfZ8A8osfVW5ISb28Zxuib8KoUeBwqs/dBzTNltrAX1uOsbGDiwtOZ5KHYyKIKUMk0xc9g5ANs1vZlJEojT9tbSVFep0B0qg0l7XT9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk; spf=pass smtp.mailfrom=philpotter.co.uk; dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.b=D8FYLI4F; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=philpotter.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=philpotter-co-uk.20230601.gappssmtp.com header.i=@philpotter-co-uk.20230601.gappssmtp.com header.b="D8FYLI4F"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43998deed24so53544815e9.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Feb 2025 05:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20230601.gappssmtp.com; s=20230601; t=1740491828; x=1741096628; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xCMWClilUVx4gbpg5+ELoexid4UMYXeO+KTrE/EAgvo=;
        b=D8FYLI4Ft8e2JNP8ge9zLFRzWxUgBNFMSjtEsxLJKoGdEpYesgAF9/Lzj2qTKnVKhS
         s2LPNaVcDcCP8noKX2TN7QohyeXRlzW7Xre886WjuFDGV5aSYnOAvGKwDexKJZbTo6/8
         PlInIW6om1fPv4Fs4v0S+CPUD9RtcjHmYjtrJpRpmcys87grNf4RgxxrJvW02BypMZzk
         XJB/epcd32pviABs7p4QBSN23DAIyzSWh8GPGVJG+GaneZz9AR8G/1lhNGjSeyuzSZcA
         Oh1NF8+bIJWSvuv4py4XxCYrclTknVFS2QtDt3ZrbdzpHJRBvgVBhjalzrMZfL0saD29
         Wg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740491828; x=1741096628;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCMWClilUVx4gbpg5+ELoexid4UMYXeO+KTrE/EAgvo=;
        b=Qg20RflsYOIkdZTZh4oTVPHqD5tAXIxCtiIqDo/wE29iCROypH3f4SjbzV08qJJPFI
         zSIuYLf4bOaY4Sujw2WWj1YkZ6kmumZ8Ij0E93tj1IEkh0iYXeEgcpd0ah3+pT98YF8I
         w8O3SAt023SvJwi6Tui3QowcjSPdtVOIwCII6b7nyTU9g1CGjs7Ufl+U+9/oGDSSFSMu
         zytpWdJm26uhEBFsJd4kixMZH2YdpfQRapj6G1fFt9h0xmZXiGmZXZL2O9BvyEBIaKBf
         wyLolEQoKB0FieTv1mG0JvCaR/ELTuxOncbXELP9mQgBLeq4lB6KrVeEy/dvucR+76S3
         xfjA==
X-Forwarded-Encrypted: i=1; AJvYcCXztpGaAL2retBS4k6tVgCVHjhOoC1dcxO7RI0u00i8s8L5l8ci0IhE2Kp7zBgAyAdN9LfnqxwTP+I0Qmu1@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7pS7yftZ8kmBFpRiTXNLS0RUBI3hs8CDAhZUcmEGaMHhhLd/Y
	pfi4Dah+ia8eGx8NvDSAuKFDujCiQZ2med4MiGW6N0vHChPyI+7vGsGwcF+kAsv2XAFcSu4A103
	C
X-Gm-Gg: ASbGnctGLBp+uMG29r2VKELXwgz48WKIABuFA0Gv0w3VdNE9pTHKL9/HH1ISU+PaTHR
	qB6MqhWZERyz3ON492E53csSJ0x04N8WwdWs6Uv3sAbbNYRCondFEp9Mos9OPUCLH2bC289nidc
	BWEKx3UyziqJ/AiXrNCj9W415o/5a8gR4V2zT1c2NtpFpS0L/BtMY/+XRDLtJomprTzbycGRcaQ
	TN9bg77or4v4Q2VJjW+g/jZWvogEd0iBUTnhJjN3jMFWlGH5Rcs7wnq8w2AbK3dI/gDH6zYP5//
	Xj8s2hJ04Ayg9rhvvwPpJD4StrYQLiReY0kR6wQJd6E8MgzojjR+6heU2LDJhpKL3zx8NjYbZx+
	/NNT+NxrY
X-Google-Smtp-Source: AGHT+IG3o40PfdZ5xWkkYDR1eeBLAbfrWGZbWWL7adAfr6rI6bN+lbIQp0cgoQxoVPTgCqdy1XoClg==
X-Received: by 2002:a05:600c:3149:b0:439:969e:d80f with SMTP id 5b1f17b1804b1-439aebe6b9bmr154964415e9.31.1740491827635;
        Tue, 25 Feb 2025 05:57:07 -0800 (PST)
Received: from equinox (2.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab1532d9dsm27945595e9.6.2025.02.25.05.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 05:57:06 -0800 (PST)
Date: Tue, 25 Feb 2025 13:57:05 +0000
From: Phillip Potter <phil@philpotter.co.uk>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: phil@philpotter.co.uk, paskripkin@gmail.com,
	Greg KH <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>, baijiaju1990@gmail.com,
	stable@vger.kernel.org
Subject: Re: [BUG] r8188eu: Potential deadlocks in rtw_wx_set_wap/essid
 functions
Message-ID: <Z73MMWEI7o59qzDL@equinox>
References: <CAOPYjvaOBke7QVqAwbxOGyuVVb2hQGi3t-yiN7P=4sK-Mt-+Dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOPYjvaOBke7QVqAwbxOGyuVVb2hQGi3t-yiN7P=4sK-Mt-+Dg@mail.gmail.com>

On Tue, Feb 25, 2025 at 09:02:00PM +0800, Gui-Dong Han wrote:
> Hello maintainers,
> 
> I would like to report a potential lock ordering issue in the r8188eu
> driver. This may lead to deadlocks under certain conditions.
> 
> The functions rtw_wx_set_wap() and rtw_wx_set_essid() acquire locks in
> an order that contradicts the established locking hierarchy observed
> in other parts of the driver:
> 
> 1. They first take &pmlmepriv->scanned_queue.lock
> 2. Then call rtw_set_802_11_infrastructure_mode() which takes &pmlmepriv->lock
> 
> This is inverted compared to the common pattern seen in functions like
> rtw_joinbss_event_prehandle(), rtw_createbss_cmd_callback(), and
> others, which typically:
> 
> 1. Take &pmlmepriv->lock first
> 2. Then take &pmlmepriv->scanned_queue.lock
> 
> This lock inversion creates a potential deadlock scenario when these
> code paths execute concurrently.
> 
> Moreover, the call chain: rtw_wx_set_* ->
> rtw_set_802_11_infrastructure_mode() -> rtw_free_assoc_resources()
> could lead to recursive acquisition of &pmlmepriv->scanned_queue.lock,
> potentially causing self-deadlock even without concurrency.
> 
> This issue exists in longterm kernels containing the r8188eu driver:
> 
> 5.4.y (until 5.4.290)
> 5.10.y (until 5.10.234)
> 5.15.y (until 5.15.178)
> 6.1.y (until 6.1.129)
> 
> The r8188eu driver has been removed from upstream, but older
> maintained versions (5.4.x–6.1.x) still include this driver and are
> affected.
> 
> This issue was identified through static analysis. While I've verified
> the locking patterns through code review, I'm not sufficiently
> familiar with the driver's internals to propose a safe fix.
> 
> Thank you for your attention to this matter.
> 
> Best regards,
> Gui-Dong Han

Dear Gui-Dong,

Not sure what the responsibility is here with this driver, given it
never left staging. I've not looked at it myself for years, so genuine
question on my part as to who is responsible for patching it (if at
all). It doesn't have a maintainer anymore to my knowledge.

Also, apologies to be the bearer of bad news, but it upsets me to have
to report Larry Finger sadly passed on last year and is no longer with
us.

Regards,
Phil Potter
