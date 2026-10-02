Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB2940242D
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790945541; cv=none; b=MGqc/7aM+zziFACLsHLKHrGmAuNCIYp+5dsPPb/4toRIa9z5dqEhwoQA1qL+iwh3qarhKyYn3hYDa7WZ9Pai/PB6AARVsgpeOXMWMyJ90HAEhne8DKVuGiGh4n4T1FSDXZ+U0Mwq2Fo/t7MarwQ+ZDxKui9HQ5qM2ACtXN4wE64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790945541; c=relaxed/simple;
	bh=f6JvRf5cXMcwuYhI5B1gEJ3HcRG24XuF8kIGhCAv6MA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c1iawvHlsb8+VvrMt2ZwsoejAGyJumdieNmw0a/ltaV3qM+Qh0JrkYpLTbFP0jC7WWVmxb3zSS6ZJ0DiBYzNuAN8JUTDEZWj/bNTurpwq7B2LlpNx1dS0OH8w2fBdOogVwhAE5wChnTzOYuI7U6oiyPMLE33xP6DwvnJDhtLYiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U1icpor6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U1icpor6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790945539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tCH7oA4DdPw+pCkiWuwkP5ynmVOdNK54ww31eSeUk6E=;
	b=U1icpor6JO/+XEIKdwhAuwb3f6RQRNdaZ5F7xa+yAxJe8Fn8t7YopWosEzYIg1P1SQDVzb
	roDq8J88PZgg8Bo7kpB/srJxesu4lFgg2YaYpdvn0ULeLXGVPUt0Rcexh9NMRXjRlV0jKK
	1B54xuO4K3mf4NNN3NUCamDjdsxOO7c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-402-Yo6qmMFmMoymPpnqeQr7_A-1; Fri, 02 Oct 2026 08:52:15 -0400
X-MC-Unique: Yo6qmMFmMoymPpnqeQr7_A-1
X-Mimecast-MFC-AGG-ID: Yo6qmMFmMoymPpnqeQr7_A_1790945535
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a165fb7beeso133435e9.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 05:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790945534; x=1791550334;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tCH7oA4DdPw+pCkiWuwkP5ynmVOdNK54ww31eSeUk6E=;
        b=aoumN/NbojyX0JqfURKqaFqgBEFDy9Wx2YgzNf3Q9DT1Np9Zm85wSgbq798FWXnBkb
         3h1RDfCFIWZeqLuf1L1niJo1Lbv75zeo6YmngzvDkzI4jhcV5mcwqcYzDaO+afoVkm74
         5nfvGiV3vM/VQXH7ndpmtbH23QfHB9s41kxMPElxyfYQamTdm5quCUlqYEBCQ1epLp2w
         XEZ9GVS2OCRRGGHa912Dzxj+CJ11Ofev0dfqSzhEBdXCZaZ0rYp8V/FNEkAXcSW5DcU6
         fG7n4EeTbU84jaD+TM4X8JNro1ToUJK1chk1kQEOFVFTTV7FpnQI8SOW2O0hpQZ6W63J
         kDPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzclUawBuFFZpILfimg5We2Jw+TS5PB/lAfYhfNfZ+WWe0RBs0fbPwV4gkWBQZNNi00pf4Y0R4F0Ve0ctut@lists.linux.dev
X-Gm-Message-State: AFuF++lQZMFy8MgCX26quEtheaECnd4ec4hJhIwic55Pis+98dztXmAo
	HQ3PlXyMvidkskVsYb91TLsFIVPNbCIVO4gCbyuLnKFWkH2JbrxJvr07w2VDk5ZKonZonHeVFa9
	JZvAnegOHWAcCWg5kmTcKvL04X4r9IhSFF9bzcXo90SWZoSWU8nYaYaqa1EKPSf1c4iU=
X-Gm-Gg: AYBFou3OPowqI24z7lREuScdH1oquMhjNywWGrr6e+dKYb89/6LeEDxC05xMv5cTKCH
	LlrkMS16tZ2IGRP3H/A03bDjviVrynAa5WgqWtMLG402vHRJ4lRbTNWMv/ytHryn6azQFWGifEy
	ZKiBXjoZ1GpE0Bmlk6ZuU1LqNSeVeMBwLn6jZLxoq+sjvcCLttVV53/3sKtuXOziWbnhPfXd1Bd
	pEJZaAHDPe7M3Nn5wuN/6o7FGYH7nA5HUkgc0VjQ0uRA8CJBc46BYBnynwVpyivwCwHboQ6E/He
	GqtKItxMn1QB5nR/0rZt6S+ToUlNJv6uyekNBiK6Nz58MsAAEiTbRCUFOsIILyhDHfSFtowPB72
	y2JyxCRNBf9jMbqRjlcSqXETm4TVXTB0qNxiuFUhhi3r7kpIpuji5uWacJu9IbWpJbg==
X-Received: by 2002:a05:600c:1911:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a02756643dmr43591495e9.10.1790945534460;
        Fri, 02 Oct 2026 05:52:14 -0700 (PDT)
X-Received: by 2002:a05:600c:1911:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-4a02756643dmr43591275e9.10.1790945533987;
        Fri, 02 Oct 2026 05:52:13 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38105239sm7570526f8f.33.2026.10.02.05.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:52:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, decui@microsoft.com, ssengar@linux.microsoft.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 sashiko-reviews@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 7/7] drm/vc4: Do not include
 <drm/drm_simple_kms_helper.h>
In-Reply-To: <20261002124456.741011-8-tzimmermann@suse.de>
References: <20261002124456.741011-1-tzimmermann@suse.de>
 <20261002124456.741011-8-tzimmermann@suse.de>
Date: Fri, 02 Oct 2026 14:52:09 +0200
Message-ID: <xlv15wzk6z9i.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VfgdUrQjaNX9a6C9W-dZNMkkOVLGZ8_zVFFjPjmKxR8_1790945535
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

> The vc4 driver does not require anything from the simple-kms
> header. Do not include it.
>
> Suggested-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

