Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421DE33C0;
	Tue, 12 Apr 2022 20:03:29 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id j6so14664843qkp.9;
        Tue, 12 Apr 2022 13:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TIso7zjRvJ6JFk0OKYu4b1IOgyo67qS8pjQR4R1CTwU=;
        b=O5W4FURXIk/koR1AiziVbc22Jnz6VO50RBwFh9m5NvNBjxPTrsut/JMndhOuajYrEr
         DS3Bfb/M0PKvcXMOloWcp45H7AWwSVNV7WhKHgYjYQe0EBX17sW8SUPNkdRtDhRbChI+
         Xou3ENfTd/zd1DO4d47KFUSvcE+AHTk2eWFk6gk68h4EL+I/CSI9xd7VWAmA3LL+Mgce
         y2M75ohA+irDdOoOuILSb7EnlP+uVmz3/J7duDnsfcl1X7J09qzSf4FcdqSf2VqEekp6
         FZnmpGhpXfnuMckGAsrIF7Wv5GfjtYKJRxM4p/KWyTb49PrG/N8R7LFhbzsnqOiLbdt0
         iZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TIso7zjRvJ6JFk0OKYu4b1IOgyo67qS8pjQR4R1CTwU=;
        b=0wGB9WuQPSnAUs2PO3sOclH65EZowYVopuIRHwojjyXWB3wmUt9ZY0gBdI3NkPsxmh
         R9SG6XeMKC2cW4EAR1G52pPuW9oXobgDsHRrIrurE86VAUmXhDMiQ23oLHEIFVcWe4+6
         s9f3eO3XMU9wRzDbkKZ5V8DXISVd6/Lxg5kr06waAg9fUltELmPxDSApBvPtBpVQWALr
         39H/DW9ttuY8xEUK2v1z23xLDL6eF8n4IloxG0INChhK2nJDECoflmRrZW9A3PEG8VqZ
         K0dB412DLvz2VI8JxyGZjqbrGnrfX9eOzB5nYnwUFWsck/8/VWccweHcxARIsJ88ooB3
         6WDg==
X-Gm-Message-State: AOAM533S0n8O8JuLlx4jl0Uj+msrgUXGUupq1jRbU3IpDmXOg+3YYwA/
	1+Mdu1EOpvYISZGpIazKr70=
X-Google-Smtp-Source: ABdhPJxN1K0eq7eseLiEBRiBDNhG1W+9Hx7k7WhgiWKwhUnqlLh1wfTMx7styNeT3Vbbkg7YLGFOjg==
X-Received: by 2002:a05:620a:4151:b0:69c:216f:f6f7 with SMTP id k17-20020a05620a415100b0069c216ff6f7mr4412625qko.444.1649793808257;
        Tue, 12 Apr 2022 13:03:28 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id 3-20020a05620a048300b0069c52ee270csm140606qkr.89.2022.04.12.13.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 13:03:27 -0700 (PDT)
Date: Tue, 12 Apr 2022 16:03:23 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH 2/2] staging: greybus: remove return in an empty void
 function
Message-ID: <20220412200323.GB2963810@jaehee-ThinkPad-X1-Extreme>
References: <cover.1649712572.git.jhpark1013@gmail.com>
 <eaf51ac31d264179298cb24c91f05a14e3651bda.1649712572.git.jhpark1013@gmail.com>
 <20220412072843.GD3293@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220412072843.GD3293@kadam>

On Tue, Apr 12, 2022 at 10:28:43AM +0300, Dan Carpenter wrote:
> On Mon, Apr 11, 2022 at 09:50:22PM -0400, Jaehee Park wrote:
> > Issue found by checkpatch:
> > WARNING: void function return statements are not generally useful
> > 
> > Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> > ---
> >  drivers/staging/greybus/audio_codec.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> > index 0f50d1e51e2c..3e3a16568def 100644
> > --- a/drivers/staging/greybus/audio_codec.c
> > +++ b/drivers/staging/greybus/audio_codec.c
> > @@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
> >  static void gbcodec_remove(struct snd_soc_component *comp)
> >  {
> >  	/* Empty function for now */
> > -	return;
> >  }
> 
> This function is called from snd_soc_component_remove().  You can safely
> remove the whole function.  We do not like empty stub functions.

I'll make this into another patch. Thank you for your suggestion.

> 
> regards,
> dan carpenter
> 
