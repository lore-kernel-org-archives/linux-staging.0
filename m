Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A2B612F
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 08:10:26 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id w14so19646844wru.8
        for <linux-staging@lists.linux.dev>; Tue, 08 Nov 2022 00:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4QtVwIE3iZ0eHUBerHEnwY8Oj652LtFgZcRYLE4Yt4=;
        b=DkgSIIBu+pZGOaqX8BayQHmLJe8c/9VaQWRuMrnAyGSf4M4P1Ut5+8SUUcU9m9I7zb
         zuP/tqO/wSuU3QlJrg0wtSqMtZMDKNpURwmCwLIBEwm/yj6LjGUdPeh4aNhFE00IkKkj
         be6mIbgXgLyF09oyq76hHVG/XfxG3rPOvTyRaNG6LcUJlgl6QxRKCyMflID9josFKbCZ
         pBgNd4pujg5xyUvyZjC+dvnbWmEOrqbP6dI7Jz4kqApMpJNVk74kncPP5tiz0AOSCqR8
         FjaJeNxg80RGj977KQbeXdarNhLnDEBAgBs6ZcAh02fckQT8/GhiEXsscSGhcIul6C0o
         jHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y4QtVwIE3iZ0eHUBerHEnwY8Oj652LtFgZcRYLE4Yt4=;
        b=0wF7XW2/+i+anEcgrg36okPV2sld/uWboIXy3gpjDAkNiGEDU/CH31paoDwr9+dcCv
         Dj/ac5XqZaUO57quq/+9olNaJVUwHxXqYvoM2/Fg4X6g8H4F8DoCD0DelM7hJUK2CHo3
         wSwAKLFa8Y6oyxpUoGisxfI2c4g1U0l8Ac8wk3v0l4OU20Vg3Z+salbBx1UxtinvAeGf
         DbguK1H5xkSqSqjrRIAdWgiaoeFz+mkANVaAhehmqfgnTJXyjcT+ER9sYY9hL54iS61E
         0W8Q+CLyGGzjEXJpCKp36laPlKZLcYX9ysf7WVyq7iGrnN/RxlI4j51844EaVbzHSPu/
         BYvQ==
X-Gm-Message-State: ACrzQf0V0CA3/eSr5cZl7eZ4w61PKrFlnc4ZEcV6mjn64G4Jzq//xlRM
	e51j+OLHR2dzS5rbdd409SgJdDsGRsQ6Bw==
X-Google-Smtp-Source: AMsMyM4kUvDPIy5Y848LkhbCiK8D3HDVHquXnAcIQWaFpwuBVc2yEvuVjN5j8IAtFHnVw1tRkghoLg==
X-Received: by 2002:a5d:5c0f:0:b0:236:c429:361a with SMTP id cc15-20020a5d5c0f000000b00236c429361amr30800977wrb.475.1667895024558;
        Tue, 08 Nov 2022 00:10:24 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id w2-20020a5d6802000000b0023662245d3csm9451993wru.95.2022.11.08.00.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 00:10:24 -0800 (PST)
Date: Tue, 8 Nov 2022 11:10:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Deepak R Varma <drv@mailo.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: patches for staging:media drivers
Message-ID: <Y2oO7fU4whKr+3hb@kadam>
References: <Y2eSCZJNWn6DzCUu@qemulion>
 <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>

On Mon, Nov 07, 2022 at 06:29:30PM +0100, Neil Armstrong wrote:
> Hi,
> 
> On 06/11/2022 11:52, Deepak R Varma wrote:
> > Greetings to all.
> > My name is Deepak R Varma and I was part of the recent Outreachy internship
> > round. I learned during this program that patches for the media drivers were
> > prohibited to be included in the Outreachy effort due to lack of bandwidth for
> > the maintainers to respond on those.
> > 
> > The Outreachy round is now over but I am continuing to work on code improvement
> > and changes. I would like to know if it is okay for me to now identify
> > opportunities in the media drivers and send patch proposal for your kind
> > consideration. I intend to send couple of Coccinelle identified code
> > improvements as patches.
> > 
> > Please let me know.
> 
> I won't say no but since the media maintainers will need to apply them,
> the problem is the same.

Yeah.  Me either.  Those rules are for Outreachy so they don't apply to
anyone else, but at the same time no one is going to Ack your patches
without seeing them and especially for a subsystem they don't maintain.

I always try to think about if maintainers will want my patches.  Like
I sometimes see people returning -1 instead of -ENOMEM but, you know,
unless it reaches user space it's not technically a bug.  You can't go
around fixing everyone's bad taste.  But everyone likes bug fixes.

regards,
dan carpenter

