Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E3BA31
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 04:18:52 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r2so12656666wrv.7
        for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 20:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K4pDbcj74Wbcg/58B56E40yhsIDYcgblc7WuBVkYMZ4=;
        b=eEJh06r4R2daIAfn1xURfmMwc6qN973syj6XOdabRBcw6azMQ5FfxwuCzR4zeVqkA8
         3Wi+XkZG1BjPit6NU6Rm6W7jZboN0MVD9PJIIoCSevZZcf1Q6IvGUrJorvT+RhDbMs95
         7sin78GW3njueM3IwlL9PByEEjeRW/XTEnmrbxtxwAsvYlPtsgSuI21VVKkjxvwpJIsx
         Kat8B1UGTgTxBeMcBsUjbDE51ISlEc74rbNYGTluOJHgVfiZaOKat5aT/OjRrmDFF6EW
         VQuNdyrHBWhMQ9Ma2gNd1plgI94qxscklnpCkCu4V8e6x91JreoOQzBuRkJMjrXAJWtl
         mrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4pDbcj74Wbcg/58B56E40yhsIDYcgblc7WuBVkYMZ4=;
        b=vE0tle8R9yraKsSP0r0QW3u44M7XJ3q3PxnrWnZBfDNmIlnXv60OWwkCu72qv+n3U4
         thki+Y8nMLpSzhlExg3nvoEn7g23AbpEod/McONmewdxT3yBZJHx7ID+9PoryDdhpJqO
         /O5GDz3hlTY1KcHOLgbV1JLW+B1QEKHC1G9d/WsvyU96qAsTk5b4ENOhW3eyCSW753rv
         10RsCm33J40JR0cX9xcwrKe+ybuLsKp/n2UpmW7OBE2xtFLyVXJ9xv9HkCEldE/uo9fT
         MmvJcbJ6rdQbxp+iAGmeqA6xmy2R7xIgNtLxdKCCzQLlI4sp4yXpbjmPPVYD6kPztmoH
         fgcw==
X-Gm-Message-State: AFqh2koafekL8HLs+fVri2TXu9zlNDVTUG2QrV7iyUVFJgCZTnu3Ro97
	RZxshpVJ0OcNhQLRLlN2orY=
X-Google-Smtp-Source: AMrXdXuU+RiiQVIsOLUuAcUY0r7W+UMek2Ck+OomzTAKLbAZyP7BRoLqhtHT6QAV56t8J/dUfiLDzQ==
X-Received: by 2002:a05:6000:603:b0:26b:e7e1:ad03 with SMTP id bn3-20020a056000060300b0026be7e1ad03mr26304968wrb.55.1674533930714;
        Mon, 23 Jan 2023 20:18:50 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bv17-20020a0560001f1100b002be2f18938csm823273wrb.41.2023.01.23.20.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 20:18:50 -0800 (PST)
Date: Tue, 24 Jan 2023 07:18:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Brent Pappas <bpappas@pappasbrent.com>, slongerbeam@gmail.com,
	festevam@gmail.com, p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org, s.hauer@pengutronix.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, kernel@pengutronix.de, mchehab@kernel.org,
	shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH] media: imx: imx-media-fim: Replace macro icap_enabled()
 with function
Message-ID: <Y89cJvIYtg9fkczb@kadam>
References: <20230123191714.22430-1-bpappas@pappasbrent.com>
 <20230123215105.fbfzxueegtnbu4ym@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123215105.fbfzxueegtnbu4ym@pengutronix.de>

On Mon, Jan 23, 2023 at 10:51:05PM +0100, Marco Felsch wrote:
> > -#define icap_enabled(fim) ((fim)->icap_flags != IRQ_TYPE_NONE)
> > +static bool icap_enabled(struct imx_media_fim *fim)
> > +{
> > +	return fim->icap_flags != IRQ_TYPE_NONE;
> > +}
> 
> Nit: I would make it inline but recent compiler may do the job for us.
> 

Yeah.  These days we tend to not make things inline.

regards,
dan carpenter

> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> Regards,
>   Marco

