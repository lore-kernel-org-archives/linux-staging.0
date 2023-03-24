Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C70D747E;
	Fri, 24 Mar 2023 16:19:40 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id le6so2234282plb.12;
        Fri, 24 Mar 2023 09:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679674780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GcRU+3Df6sch2ymL5NXBQO6zVQfdEa74o4nvNV6luxg=;
        b=oWIQTF8GO82CugYWAgdiV5RGkyHBdeDUHQPbumdrXpTQseSP5VEySKvMejl9vEkVMw
         1B1IvRchFgMX0BRIVDcGH42fje5WbeHrIP/HzHJrjis4aJNsY5Mmj8yDsIoSBWg5z1Dg
         gGo8/50iB6yCBUbfDxr/KrCyXF4cixKGgVmyRvgQNLC85wm6xY/7uvrjooXlOSlnJOtB
         DcqVV3JHhwzIv9S94GdSqBmc9erf26+BNXT0Umm4ABFxErBf87sefAKiAVCD48gusIyJ
         TWxAFK/wSjD9deki8fwipuNsCs4X9QOEaS851ie/a0kjc0bqVGFdmH42g80FIvAPsKU8
         b97g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679674780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GcRU+3Df6sch2ymL5NXBQO6zVQfdEa74o4nvNV6luxg=;
        b=vz7oiLBPNFK+EHsXTjYhn9HQNBiu0ETnPE6Lu+AAWdtOYzQb3SsBiKg5K2aP2x9suI
         d1owr4UBOXgvj/m4/ClLMyHVRZ/QVOjileqdL2vNgWTarD9J9p/6z/QBri3eFC1b33eM
         XPxU7BfUbLm+2DuFw1EtE0g+MU/7nD4uHVmswkvHdOMAAKDUfyV8bpGScL0nj0Jsl663
         l4cxTxWcN2/WHRYfFZSOnQfNxPgZPYWaYEn4oT+UTVB2Cw2K5wzxxPR9aSvV/KVUw+Y0
         zDCGBvPrdEdYeU4fEIm0ePwmSJLD92XghxzU8PZZUCloKhjOYIiI7cqMmOTJkq1ZtvE9
         JIRg==
X-Gm-Message-State: AAQBX9fcCe2tqtu5FJYRZdmc/22LaSKql/PLeA1sQPojiyMHj7sMhGwU
	yTf43sHthrzDW/JQ++6r+40=
X-Google-Smtp-Source: AKy350aTgNwwO8z9vDGdaqdwVaR+5mjRd0oD8yxP/+5RxB+F62sTIoQDmv+8HMLru970L0B6ZLgFww==
X-Received: by 2002:a17:902:6944:b0:1a0:4ebd:15da with SMTP id k4-20020a170902694400b001a04ebd15damr2492184plt.66.1679674779655;
        Fri, 24 Mar 2023 09:19:39 -0700 (PDT)
Received: from sumitra.com ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id z8-20020a170903018800b001a19f3a661esm14341040plg.138.2023.03.24.09.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 09:19:39 -0700 (PDT)
Date: Fri, 24 Mar 2023 09:19:33 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Staging: greybus: Use inline functions
Message-ID: <20230324161933.GA174474@sumitra.com>
References: <cover.1679642024.git.sumitraartsy@gmail.com>
 <ZB3BshO6Yen25LvB@aschofie-mobl2>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZB3BshO6Yen25LvB@aschofie-mobl2>

On Fri, Mar 24, 2023 at 08:28:50AM -0700, Alison Schofield wrote:
> On Fri, Mar 24, 2023 at 12:20:30AM -0700, Sumitra Sharma wrote:
> > Convert macros to a static inline function, to make the relevant 
> > types apparent in the definition and to benefit from the type 
> > checking performed by the compiler at call sites.
> > 
> > CHanges in v2: Change patch subjects, noted by Alison Schofield 
> 
> 
> Please review: https://kernelnewbies.org/Outreachyfirstpatch
> Section on 'Following the driver commit style'.
> 
> To follow the commit style of the greybus driver, update these
> commit messages to be under 80 chars, and use "staging", not
> "Staging"
> 
> Like this:
> drivers/staging/greybus$ git log --oneline | head -3
> 1498054921e2 staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
> a7d2a41b7453 staging: greybus: Inline gb_audio_manager_module()
> f7d3ece211be staging: greybus: Inline macro gpio_chip_to_gb_gpio_controller()
> 
> BTW - I wasn't instantly sure about using 'Inline' as a verb in this
> case, so I did this (git log --oneline | grep inline) and found it's
> a common use. 
> 
> We're building a habit here for when you submit across subsystems
> in the future. 
>

Hi Alison,

Thank you for helping me out with this patch subject.

PS: I am focusing on writing good patch subjects and descriptions.

Regards,
Sumitra

> Alison
> 
> > 
> > Sumitra Sharma (3):
> >   Staging: greybus: Use inline function for macro
> >     gpio_chip_to_gb_gpio_controller
> >   Staging: greybus: Use inline function for gb_audio_manager_module
> >   Staging: greybus: Use inline function for pwm_chip_to_gb_pwm_chip
> > 
> >  drivers/staging/greybus/audio_manager_module.c | 7 +++++--
> >  drivers/staging/greybus/gpio.c                 | 7 +++++--
> >  drivers/staging/greybus/pwm.c                  | 6 ++++--
> >  3 files changed, 14 insertions(+), 6 deletions(-)
> > 
> > -- 
> > 2.25.1
> > 
> > 
