Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3024B3FC3
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 08:27:57 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id c12so3670335ljr.5
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 01:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I22BlDdo9NBLaeRFYeqy8S3iIoOV2ys2CHWtpTY2vK0=;
        b=li7MxxlaeaAuPlGb+aX1Mw9qv6/EFfwBgzndlcYeoHKE/P8eMm84cE0oHjDqWZi7ra
         soDt7TZRJaj20HcOeLWPGkwEUwmSw4Q5Zg9AlEsB9g+vdd0d2RD4DUCaK0WS5/ICtknO
         itlYU18B4aHZ8mjCt64FSW6V25Q602xyfTBgvrAnqyLv2MiFsyxz7oa63MKAUVuOWxmN
         1AinWfR8nZU+DQs739jUH3og3WzKESLnZh1aMEXBQbaSc/psy2yhpzPjnZ317miSnI8w
         IdQl2zgMwqYCb+TGGixEloZcxj5zlSaTVJ+bl37JsVJS27019j6rkaL34xldC/ORJMP0
         +duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I22BlDdo9NBLaeRFYeqy8S3iIoOV2ys2CHWtpTY2vK0=;
        b=G7oTGEoUhv2ZOFAzE4Scsf22N4H+OmU/Z7x+aJY9d7J1TKAuhYvu6+coJLEgLUYNO3
         poP6cW8ezI24MRt25wazVauuGy8QusNGlGiFypD0Qn2hPS5wGpqxHKCyIEyOpNtpjQK6
         ulkk1fTHD8KbYBxXE+K4cLJ0C19iLEHfCOR2MTyu/EvU1K04uXdOa4KUSPsknqoiokLh
         fWBvd1PN6WconNdapvSABhOGmA6j1gap9oAIFLGXqSQKmk/Ol1RFP8dkG4Owb6Nx0wST
         Iq/oYo7yNJWcx3UEcNU1zOgbSOxfxmSzclM0wPNMqeB0fvTc40slGk3TuDUXa2PoqMSB
         hM2g==
X-Gm-Message-State: AOAM530Ref2qjjuzYo9reN5Qeat9WoYVUD87JOQ8+SAzDCW8bits3/wp
	7jooazY8ePxepTjOmsP1saI=
X-Google-Smtp-Source: ABdhPJwIR+pepFHSiCyZ8FTBE3x/BdC/ROe0egZQukYZ4cngEkUqotMG/CVHVGW24WZ5+65PdPYA3Q==
X-Received: by 2002:a2e:a4ad:: with SMTP id g13mr2000903ljm.391.1629966475289;
        Thu, 26 Aug 2021 01:27:55 -0700 (PDT)
Received: from localhost.localdomain ([46.61.204.60])
        by smtp.gmail.com with ESMTPSA id w27sm245479lfa.308.2021.08.26.01.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 01:27:55 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:27:45 +0300
From: Pavel Skripkin <paskripkin@gmail.com>
To: David Laight <David.Laight@ACULAB.COM>
Cc: "Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
 "phil@philpotter.co.uk" <phil@philpotter.co.uk>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "straube.linux@gmail.com" <straube.linux@gmail.com>,
 "fmdefrancesco@gmail.com" <fmdefrancesco@gmail.com>,
 "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 3/6] staging: r8188eu: add error handling of
 rtw_read8
Message-ID: <20210826112745.5e1421ed@gmail.com>
In-Reply-To: <f5c20e0f1b934e04ad11a3627d71f5db@AcuMS.aculab.com>
References: <cover.1629789580.git.paskripkin@gmail.com>
	<c59d5d850bf9aab208704182c83086609289cb9c.1629789580.git.paskripkin@gmail.com>
	<f5c20e0f1b934e04ad11a3627d71f5db@AcuMS.aculab.com>
X-Mailer: Claws Mail 3.17.8git77 (GTK+ 2.24.33; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Aug 2021 08:21:34 +0000
David Laight <David.Laight@ACULAB.COM> wrote:

> From: Pavel Skripkin
> > Sent: 24 August 2021 08:27
> > 
> > _rtw_read8 function can fail in case of usb transfer failure. But
> > previous function prototype wasn't designed to return an error to
> > caller. It can cause a lot uninit value bugs all across the driver
> > code, since rtw_read8() returns local stack variable to caller.
> > 
> > Fix it by changing the prototype of this function. Now it returns an
> > int: 0 on success, negative error value on failure and callers
> > should pass the pointer to storage location for register value.
> 
> ...
> > +		len += snprintf(page + len, count - len,
> > "rtw_read8(0x%x)=0x%x\n",
> > +				proc_get_read_addr, (u8) tmp);
> 
> That is broken.
> 

Don't get it, sorry. Previous code did exactly the same thing, but
didn't check if read() was successful.





With regards,
Pavel Skripkin


