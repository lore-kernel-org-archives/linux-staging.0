Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D0470
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 05:57:01 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id ep1-20020a17090ae641b029014d48811e37so712359pjb.4
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 22:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U21rJoH55u/lTd+3NoSn40fthcLZb2sfVCKDVMCxIlA=;
        b=EsQDoXHTu4nbl9VuF2kCmFKrM2UFX9vXu5ZGIcU1q4/K1Xf20K6ol6qFxKFpetJ/iI
         Aj9hohCIyHTvQbwNnfSzNexF9dBOHn3lzgX9mFSTRUBhm+zoYP4+c29RCTZuEbLURI50
         lm1enCq73Ue8tVcdQrKKo6yrlvzAQcEJWiU8Wl9iRRUmSFrHvdgiU6z/1t/1h1h3ghR/
         xJR2RiWXLhyC6mFXshfzhnRYA7+3G5H4u8YqBA5VtB80O60xrJ13EQd3xWZ8KJ/HPW0U
         hFsdvRWSKEK6qEqIYDQZLGHoHTpUOZet6vMd7PYktcZfXjmFBz75RLIc2eNUkWxrth0K
         VowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U21rJoH55u/lTd+3NoSn40fthcLZb2sfVCKDVMCxIlA=;
        b=mhC4ivEQzLoTz/ZBc5exnAwhxZ+z0HLm6SUzXcXMEGcukm9CibhQDSnwloiUYpy1uw
         xEPH4LaW/4mfFSIClX9LOgsbt5OPHRBPRRMIBPO8mQZTWsRWLDlyGrZk4hTVKoQpM7H8
         ePYoK/ebEPtbr4hUxlvgeRd05cD6CB6F6IClQ9I7xkWcVZIVmI0MDKxZrvMlDlWhpq/Y
         6/E9UguIOzqUuR7brXJP5qF/E1SPSnTrP1ssA/iWnhPJyu7U+MRtfmF67HyuzzJ7r7P/
         rlkzXCX0rDT4uoEQBH8610CYB/xXJ1rPMMenJckM8hhmFPKNck84lWyazK3Xa32fprB/
         hvkw==
X-Gm-Message-State: AOAM53050Usb/RJ9/rqrW94q1Lx240o0hudBNr+f4beKaOUZYZ9tom0V
	V4O2A77IIhdb7LJeT4H59ns=
X-Google-Smtp-Source: ABdhPJxPbp03UpzLhfR/J68iRJ//WncNagogrPhYEy5gMNCnxvAchd6XMunHL1adZEczDlW5zxEEMw==
X-Received: by 2002:a17:90a:80c9:: with SMTP id k9mr1694475pjw.58.1617775021214;
        Tue, 06 Apr 2021 22:57:01 -0700 (PDT)
Received: from localhost.localdomain ([134.173.248.5])
        by smtp.gmail.com with ESMTPSA id o3sm4271353pjm.30.2021.04.06.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 22:57:00 -0700 (PDT)
Date: Tue, 6 Apr 2021 22:56:58 -0700
From: Pavle Rohalj <pavle.rohalj@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Convert camel case to snake case
Message-ID: <YG1JqvTMu7pmHASQ@localhost.localdomain>
References: <YGwncT6RGvYlL9yj@localhost.localdomain>
 <YGwrqUkAUWzccKA2@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGwrqUkAUWzccKA2@kroah.com>

On Tue, Apr 06, 2021 at 11:36:41AM +0200, Greg KH wrote:
> On Tue, Apr 06, 2021 at 02:18:41AM -0700, Pavle Rohalj wrote:
> > -	struct dvi_ctrl_device *pCurrentDviCtrl;
> > +	struct dvi_ctrl_device *p_current_dvi_ctrl;
> 
> Does this change make sense?  Why keep the "p_" here?  We do not need or
> use, this type of variable naming in the kernel.
> 
> Also, please break this up into a patch series where you do one
> structure change at a time.
> 
> thanks,
> 
> greg k-h

Thank you for the input. Makes sense why we would not want to include
type information in variable names. I will send a patchset with changes
broken up into smaller chunks soon.

-Pavle
