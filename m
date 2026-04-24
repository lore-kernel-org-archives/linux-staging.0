Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96778313550
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 05:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009686; cv=none; b=nu4O7NHmK2R7WDTqQB+lhZDf8mbbg1FdC6hO74US9nTeihK0lgZ6ITYhewXuaR4174rFAaqnw98NAF7JH/ZBEeMCt8y536s8zlXFlMKbKOftxNchjVcJY40ih+zxKLHo7Ezd5SdyW0TebvLXWJINv5kzoaXURWR04KSQPVWme7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009686; c=relaxed/simple;
	bh=cEiTno/uh3xHogJLY1rD/3Lq75ip7IpQ33GgXc+X/wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkAnW/PbJ5DrmszgacSpWCfp7Hr5tcZ4fyYbCc+oBy8NLj5ijaEely/MkKpuQRO4QAC9KvV6Wd/Nq++/cqOaCYpZxXO8T9vjJYGLlycwwZ8mRXWirrJ2NYeaINv9z1U2Wgty0pKMyJXhKqX63IYmXlVnZWiDxEyB1CQqJpbw8qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuLkvhJT; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuLkvhJT"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso4075868b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 22:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009685; x=1777614485; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cEiTno/uh3xHogJLY1rD/3Lq75ip7IpQ33GgXc+X/wI=;
        b=OuLkvhJTjq7Rxn8gfRL5CojJTZ4GXjKb5c6LCN8BEvnOx+NtVXASk8rOeDHwUG9lET
         abfjNVoXR7EDXErOJtJJ2KGh4rmZJsBBOF1havMyZoW7njSPqYE8rPnLiOrgiWkkf5vg
         bKzyQdTz/PiL23+fSX/pL+eqyC+eDBSjv2kdG+R6gGyDKMsAVhM/wVLEipDCd5rlFpFw
         EWFmmggdSmSpUtky+WFEcAxPXG0GsNG5mbTEL03GqeL/iWRUrJbmxkmyYmmQevTzlbxA
         GArpZjgo5QNA9phWYdB0RBXiwlPzYRFABMmwqbn/E4Xv86piO3ZH3vvhmseTo8M/Taio
         MC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009685; x=1777614485;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cEiTno/uh3xHogJLY1rD/3Lq75ip7IpQ33GgXc+X/wI=;
        b=rhPk/iJs3B4sIAO6SeGir+xfMQMvmN6Zyr28zlcjJJTep3+JCK+ZhFwRodNad6h7Hg
         ylH9duvMEn7sv6flvv9DKFMc8THZV861MnSd7vZFsYPHicEC5tukimSDVU2Kcu1J0p+G
         N6frZ9PIKuratELQHrzavm6T8ZjEh10V9ORwxUVkidVoAVtT5G+TcPc+JenEGCGH/u3e
         9CP0uoZJNH8d37eIF6vS9X4jC5FgO3QcpLYnMjl/AP/gtD5IjmX+BkVh7y2sHN8rj4Kz
         Mv61NNqp31zhAbDXIdmwdAVVXBR47d4/evWCLTCiKX9OuGmZ6/TTcbkJIRDyPR69YNU7
         XHUA==
X-Forwarded-Encrypted: i=1; AFNElJ//ivVVOz79Yz+x/S9Aarw4nFHsbcNQqzGJ2nWtxbdUaZGczCZ33tp7o7pFWyoaDo6B0BbQ45M2dU2VX6/H@lists.linux.dev
X-Gm-Message-State: AOJu0YxCDB2XHJ9nIa8DIUeQC1p0p3um8PHdMhYa7UPZHFtJL3AUlNLN
	C+IBrVAN2jVKdpQEUeF4LUUZrIDoctSYX896eV/Y6dQeDFFZoYk+cMu7
X-Gm-Gg: AeBDiesGbBL7g6i6PcmRwzfnJq64ZPm6r2emwMpPqC9wRzqQiHiHN97+j4nxHrzNrDY
	hXl0BrSvO2HCtTSBeI3sNg4oSA8ZxN2CO1neOmeuN/jH0DdGxFqBK8wjBbmwbluCVs4+KcSELQe
	PL8JhhPz073cjQjtFXoDSwOKctF9GO2xli9tQ70R7wwL0lE+D0FNzb0/9sAkVigP8jDziRduNip
	1ycBgzylVlhJHQI2ZXgg++nNTPZgxYc0GAYMOnqD1P7mgh0tn/WYlkp1XsKfwAp5TvagRXkqZTS
	pPGRBPBT61deXtd1OH3NJfnpulJOYdBJRgNMnqnhmJ5T5/deKGSYBjjWmBqFuzH2nF5eGn1JRht
	xH7teOR2SNeU0fH84YnywMhJk9fUNVzwf7w2ZW+X+iGzMONYJLuNBoX+TeIpsY/cw0MdTa3+GV5
	y1sNwSZklYpg4qGUQ9DNkc8Xb0UpZ9MHy0X68m
X-Received: by 2002:a05:6a00:3cca:b0:82f:120:fd6f with SMTP id d2e1a72fcca58-82f8c40ae88mr31344043b3a.0.1777009684887;
        Thu, 23 Apr 2026 22:48:04 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:993:9321:304a:9347:5e0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9e0f40sm24070785b3a.17.2026.04.23.22.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:04 -0700 (PDT)
Date: Fri, 24 Apr 2026 12:47:58 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aesEDiGBZiScCb0D@soyboi>
References: <20260423060246.296986-1-robertusdchris@gmail.com>
 <aenHeWS4y8iLkMAn@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aenHeWS4y8iLkMAn@stanley.mountain>

Hello Dan,

On Thu, Apr 23, 2026 at 10:17:13AM +0300, Dan Carpenter wrote:
> On Thu, Apr 23, 2026 at 01:02:46PM +0700, Robertus Diawan Chris wrote:
> > When calling ia_css_pipeline_create_and_add_stage() function, there's no
> > condition to check whether ia_css_pipeline_create_and_add_stage() throw
> > an error or not. So add conditional check for the return value of
> > ia_css_pipeline_create_and_add_stage() function.
> >
> > This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.
> >
> > Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> > ---
>
> You need a Fixes tag.

Oh I didn't know that we need to add Fixes tag too. Alright, I will add
Fixes tag in the next iteration of the patch.

Thank you for the feedback.

Best regards,
Robertus Diawan Chris
