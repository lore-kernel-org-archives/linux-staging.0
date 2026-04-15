Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0A24594A
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 12:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776256375; cv=none; b=J6B/tR+2Mh8oIa3GPNJX77itNo7XaUWojEKwkv4IXFLKyMo7tpSnj7o1qa5qsMx2EOY47sWwJlDuR9JgAE3TJgmODRwzQ6K4rTk2qPUwZa03PiSIq1/IXnvx9NlYQTdMoyxPKrctriLDlEYXufoI1I0++X9OdewyNtf0cEvFGJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776256375; c=relaxed/simple;
	bh=4fRC7ugcdpBzmiBi94pawPj2gQ01gH31+CXKdFmV2kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AHhTMypSwJB6s7ly9dPtNSnovo8lNMvC0VdYiXaaQ2GmnWhe78RUUQU3ykURf5CiBHAzZTKjDnKYcTwwoIuGBwW/9JTn9JiqG0+KASzYLjWPjBWRx+UY9N8eJ1CTb6y+XARem6DxLDiwUoNtUj/n7cyneMWUvLZpm9jBRDcec0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCG7AfjL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCG7AfjL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488d2079582so62097905e9.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 05:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776256373; x=1776861173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4QGKACJwE2/9AKPpC8u6xf56pqFwJttRvP08nI/Ba4=;
        b=tCG7AfjLRcZAks5OzWg+R2y85loPsfljjaCf9mLlfkL0wzqCEgQ55pYIFF0c1nvjFe
         NY4ZvLYwU9JUhpI5I6mEcpg+hMUbVa8qe8hd+GnKFeBT2RT1p4jvs1XAcjJhzQSK+LoG
         d7EQqA2A/hOwnb9AuTmDlgnsyNmcWgxbx7dF11yf6nbQIAra3iwTRQ1tmdA5m0hg0Sa0
         TNhilEPTpxkbBIq4veupfwt1CgVzJiQxGzjGd8kuTrDLy+Yrm2Q1GAgTzUZ8qPgHye/V
         Y60SNmdXQbT0rEOvVnTy7j+W4MtqvBYJ+oklYQub4KZ2lYstAcsJsP2+U+55yKMUFPrc
         wUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776256373; x=1776861173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4QGKACJwE2/9AKPpC8u6xf56pqFwJttRvP08nI/Ba4=;
        b=r2MZPDKU3U4Yx5oO6WewLXrlHqvzesB2C8juzvvb7mNmwLrV+8q3RNkSXGyvdcwJsE
         BpE+pusU6KZvHMCaWggSi2wNHKBzyZn7uhFt8SRZDCAsIAXzbD5EF1NqT5X2f7k8+Y1O
         XoroFMK/gp79FqttjEyjmVsw68HilYoC5AMTnumdcVeDXv1t6Fe1Pc3evDPuZD/k1FPc
         u+dpT89UJ21T+x/qfLynJxB2JbzozdsYHIWx8DzESGP1BCQlUKsMFGco8unNHn/MF34L
         xe2nXHE13aU2GJn4YDEOF+0vmwJEqH8X0biEVrIKNM2YrFymuX7gRNoUur/XjjuyXnGL
         YUhA==
X-Forwarded-Encrypted: i=1; AFNElJ+PEW9Q3ZQg2OgpJaUP01NVlpwSNhDEDwBH/BazksnfTOfU3bpAGQhTC0DYM7A2gzyueol7I9hHHjTDtOnV@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6yjQo8xTazV9abZJms0uzPWEijf2nLbFqTQIwsOIIw35yfEYW
	OgPXypuFq8s8qKW6/J/vP4JF/7sNkzfH3iF+jV6+ElFftGbqwLNm5TS625msAOpRAvs=
X-Gm-Gg: AeBDieswi0pItUVvMo14xvXVvhioUihzlZHeqAI2YaWPfi82V0q0Zamzgh4S/vpsJnr
	oHBvEtIzdnHhFgsb7B/Z1b5SimciN1VCgYbEJ2dMPYDRpvLLOC5K7lLYCgcUFy2kJjtRZ80jFM2
	1875VU2XYe28N0Hq+qovJsV9WM1QE+7u6SSKW80GZ4UDz8AfV8/oIY1+6j1rAOySfnwqWBIZ5o4
	6QmIMPco4V4EsaJ41/u2r4U8Elv5XpFz+n+4qu8pn6clz3BQ4LvXv43rTJHAGfyA5bPafucfIHP
	U57U+bMdodtcCDQmyLALpIpTVPUV+RgMBz3TibL2BV59oYCMBFPB6ClrPNjEZErXudJNRYxSUGz
	/pdrKR5inH8ZzFo6q+wI8CJOyU1CytMiChS6G/5l3khsMKYCvFIK0tjo42Nb3dkZ/g5hcZcmXPp
	X5ReO7BNr/MwZZJM2k110=
X-Received: by 2002:a05:600c:c0cc:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-488d686dab1mr208019635e9.24.1776256372924;
        Wed, 15 Apr 2026 05:32:52 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f1d5dd43sm47579105e9.0.2026.04.15.05.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 05:32:52 -0700 (PDT)
Date: Wed, 15 Apr 2026 15:32:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: gregkh@linuxfoundation.org, tsbogend@alpha.franken.de, len.bao@gmx.us,
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <ad-FcZeXsFlSPXQj@stanley.mountain>
References: <20260415122939.77847-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415122939.77847-1-m32285159@gmail.com>

On Wed, Apr 15, 2026 at 07:29:39AM -0500, Maxwell Doose wrote:
> This patch removes custom typedef enums and replaces them with standard
> enums to address the "General code review and cleanup" task in TODO.
> 
> The following enums are affected:
> 
> - cvmx_spi_mode_t (now enum cvmx_spi_mode)
> - cvmx_helper_interface_mode_t (now enum cvmx_helper_interface_mode_e)

Presumably the "_e" stands for enum?  Ugh.  No.  Don't do that.

regards,
dan carpenter

