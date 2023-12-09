Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9951855
	for <linux-staging@lists.linux.dev>; Sat,  9 Dec 2023 06:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jgcYNSy4"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33330a5617fso2974278f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 08 Dec 2023 22:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702103265; x=1702708065; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d2nZlR1cXieQ7aMHpSA2LHgWMUvUbq6OLThBUaEbD3w=;
        b=jgcYNSy43A45Kajke1UUpEsaQ0zswpd0/5xnodociyFkAbCEKI84h0uG+dQJeoM+Bj
         oiMMDroAmR1KuA77J2mdDk1haqVKIYfUuLEK2K+FHv7QUN8NqXhypIacBS6JN6luLf++
         j3mqSIV/AfBRvhkw2yX4hVrK1b1O08AFGlrggxZTPoi840NHBLROx6dAERFvEXTvveoR
         y0ZYFzmC707tuZv7LGz7htYkMuCX2T4AcVAp1DangN7KsEXkbu2r/7h39o1qSz7zgOGD
         EcVUzp2PVGYFW2nigQ8xRJG/4Vq6dfqwOYHHTRYONeL0PuaTFIS89kmsOHbrzaiYfucr
         GLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702103265; x=1702708065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2nZlR1cXieQ7aMHpSA2LHgWMUvUbq6OLThBUaEbD3w=;
        b=ay4migIdlq9hTHXvDE2wsmb6RDxIzGMOAm0hAoSwS7qeN8uXkGUtls6dzmEh5UUMpx
         ZG3uoKe8dmov9gyQ8VjwWY07wbNib2DJlO2dsRGa12PppsRBZQ9n0f56gkP/5f71iaxG
         iTgEAAqjaQ+IfHIoTtyrSeP38AD1auxKUMZtEFGjjlb7Lm2ASLudl3Gh3gB/Lu9KodQh
         faXnqsfybElv9x3fV9qq1z8P01BGWIk/ik8JPxFXHIvYXmfThpQSdWYsMs66ZxCdEd96
         dfV4aKXcQgfPQTIw+ZwMT4y57745RKZJ4nit+xWAK9pgbYv0x9l5Je3WEeu2T7wLIyFL
         hW8g==
X-Gm-Message-State: AOJu0Yx+xqJ/8Q/w01o6gbuX6LA9k6WkERvAf9DDpsgZtW0QTUtqYJYS
	G6GNw38sLDdNAMnrOF3T8wLsLw==
X-Google-Smtp-Source: AGHT+IGZBpmJz88ZXkhtaoFYGNwrk348/06KJfaFJkwN4nmZxozymCnv76mn/q9bMlnrfz2Wv2lYXA==
X-Received: by 2002:a05:6000:110a:b0:333:5258:68ef with SMTP id z10-20020a056000110a00b00333525868efmr654738wrw.68.1702103265445;
        Fri, 08 Dec 2023 22:27:45 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m11-20020adfe94b000000b00333504001acsm3456113wrn.15.2023.12.08.22.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 22:27:45 -0800 (PST)
Date: Sat, 9 Dec 2023 09:27:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Umang Jain <umang.jain@ideasonboard.com>, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"Ricardo B . Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH v3 3/4] staging: vc04_services: Drop vchiq_log_trace() in
 favour of dev_dbg
Message-ID: <1883402c-edad-48b7-9081-32ec3538667b@suswa.mountain>
References: <20231205084157.73819-1-umang.jain@ideasonboard.com>
 <20231205084157.73819-4-umang.jain@ideasonboard.com>
 <46e42bbf-e99b-4e61-a207-35e150fe4fd2@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46e42bbf-e99b-4e61-a207-35e150fe4fd2@gmx.net>

On Fri, Dec 08, 2023 at 01:08:04PM +0100, Stefan Wahren wrote:
> > @@ -1425,7 +1416,7 @@ vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
> >   	}
> > 
> >   out:
> > -	vchiq_log_trace(state->dev, VCHIQ_SUSPEND, "%s exit %d", __func__, ret);
> > +	dev_dbg(state->dev, "suspend: exit %d\n", ret);
> In case we want to keep this kind of debug messages, i prefer to have a
> common format:
> 
> returning %d vs exit %d

Someone was trying to make ftrace track return values...  Whatever
happened with that work?

regards,
dan carpenter

