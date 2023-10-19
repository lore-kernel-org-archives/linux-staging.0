Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17831DFE4;
	Thu, 19 Oct 2023 12:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marliere.net header.i=@marliere.net header.b="QJEQ0mHM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6bf03b98b9bso226522b3a.1;
        Thu, 19 Oct 2023 05:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719815; x=1698324615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uk0/b8RCb9t8YizAgnysUB+RfVSGoPGfH28jBwJsP5Y=;
        b=boVeSUTl0X0YQNdhysBhb2s6uWe4mY53kB7jy2WM9OojUbiGjy6lQ7cxHEmyGGaD4+
         oNQOhGda0/oVOSWK0Jl9F3eWz+IXhnqYgvn8SMd3nvXcuJveGe0HC13+vfdV7exOulAT
         aw8y8G3C61jiQsp2ZwUeNCmL7A6tnBq9mpveTiWBV0vdwj2+2WEd8mVbNcZuRzMMMicj
         0YKqxQfIT/ZY3EbPZUCPhgNJ2AxwmExt/Ry/q2OmRrcUM6w6aOgS6HCOviLmAhqZ/Eyk
         I3bYpfe6iU9OXGGfCuvrWCwPJ8n0hLW91C0+lkkN8Fg2m9gGGSgudgABWPYKnrYsllOa
         rwfw==
X-Gm-Message-State: AOJu0Yxe8RgEb7bhNKX9Zj7Sob0nsSdPH9IgLjcV1qOg+GzXmkpHrIoL
	mHAZgRWGy3hfXZ+DROEBLYw=
X-Google-Smtp-Source: AGHT+IHkw2FRDzftzIk2H/6P8awG+DX3axjSPibulNSbuum11AybLo+/c3WoYwr+lMiaeGA7fWiw6w==
X-Received: by 2002:a05:6a00:80f7:b0:68a:48e7:9deb with SMTP id ei55-20020a056a0080f700b0068a48e79debmr2549696pfb.2.1697719814935;
        Thu, 19 Oct 2023 05:50:14 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id s4-20020aa78bc4000000b006bddd1ee5f0sm5052125pfd.5.2023.10.19.05.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 05:50:14 -0700 (PDT)
Date: Thu, 19 Oct 2023 09:50:07 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1697719809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uk0/b8RCb9t8YizAgnysUB+RfVSGoPGfH28jBwJsP5Y=;
	b=QJEQ0mHMTeEEnWqg/DgQRUFkVw94gIa7EeioSfPXhTULC/sgfH2jeYlCpqGc+NqBuPSsnM
	hEpYISv4c+lwEsTxM9LHVrZ3JO7xLudnfqVXqwEqOXZLIt7XzQNk8Vn2Bz0Z/j7enXwgeX
	vHjSs2/O3HXLYO4FHMYANN0tREs9iBUzc/oln12DH+r3CbI8Ogz4uAF7KT95YGBRrxMKRW
	2EUrAQTqdZHJ2tYgSF6LvNo1ooMZvwKVwQ3B07LHIdXR7z4jgYgJNP+2iwx9CewR/aL7MT
	b+mq3O/wsJIdRgX9Nb1joQ0dVrbZWoJifatQwwemhJiNuvpO0j2rdhDx0XHyOA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: remove empty functions
Message-ID: <qqvbqinun7wbhaz47i6sk2awplknwbrfutrwfpvj6wq4wgdie6@smhzxank6val>
References: <ZTD677iqMkRPxT27@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTD677iqMkRPxT27@lab-ubuntu>

Hey there,

just as a heads up, the vc04_services staging drivers seem to be
actively developed elsewhere [1]. I'm not sure how they plan to upstream
their code later.

            Ricardo

---
[1]: https://github.com/raspberrypi/linux/tree/rpi-6.1.y/drivers/staging/vc04_services
