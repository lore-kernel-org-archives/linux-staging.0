Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172C81860
	for <linux-staging@lists.linux.dev>; Wed, 23 Nov 2022 07:59:06 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id n20so41073704ejh.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 23:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f4Agszvcd8QQMAqioCrcTnE+poivJbc38QaNotksFdc=;
        b=Yb1k+KxH+C9om/ZZiZxwn8UcaOs8xPuuxdLRjtfa51vPSFh6T0K3v8kSl5eeXRQeQG
         38z2eE2a6ItpJftrkqbbTodr6uV5OEARhHmjX9Dt5t9Xb7GfTgo1dqv5Dl8aNcTVz6Cl
         1x9cZtYp4FDthDCjnTLq7xCGeG4saj20lEinVYtQ0b2/3SYkQop71IM6uQkNkNt8FEp+
         HohD7D9Iwn/sWDiA4pEyRnj5ZBr9x9REeE6VFRj6x3/JDqSF6p4U76JcIF/Hm2Hb5Gt2
         VUojEKlDmvsjGmaC4fDAuEgYXISGcWTLz1Cv9wAyMMYlvd0vF1EiCItCnIHEqHQj5Tp5
         HUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4Agszvcd8QQMAqioCrcTnE+poivJbc38QaNotksFdc=;
        b=f/xj++7QDyMV8K/dJgehynSKIdwG4pVfSffZXf+/IMy8/14ImvIkLTFy54Q0yBLV4U
         t+HavIMXfWKI/YnuLwSqoaKu9ZxE+8TE1dfNMt0+XmBR+Dkd04RxbhBjEkJ8uIJ99+7d
         uogb5sR6doAsWea/OgnqiPtf3U962tOdXgUhHfTTiT9Uc0OPjpw29Odqm+kN3dlcUBH6
         Sv5VU0EUQ1s9sueB8ygVugTkJhjFPx5DpuSuZ99fVfqYLS/xd1zM1p0uqeqLRc6ASqh8
         0ibBWJ2eHOjPxFucUORZgahSzZnCjt3YFpj619H/s+iIuPVKUsugDTWrGWuUPDLs2e5y
         90SA==
X-Gm-Message-State: ANoB5pl/TtyPvHDYbmdxhP1pJYNqsCfE0/kmpEKEQMtFcDZ2YVl1z2Qb
	M3sxJ+c85vl67tuBK7LGJFA=
X-Google-Smtp-Source: AA0mqf6/FyQ5WmB597b5JSXc5L+Ov3fi7K3xXst75oUpGs2S8vauPO5uLf5krdfA5+X+Ciw5oeqhPQ==
X-Received: by 2002:a17:906:86c9:b0:78d:9324:6f18 with SMTP id j9-20020a17090686c900b0078d93246f18mr23171607ejy.664.1669190344265;
        Tue, 22 Nov 2022 23:59:04 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709061da900b0074136cac2e7sm3742089ejh.81.2022.11.22.23.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 23:59:03 -0800 (PST)
Date: Wed, 23 Nov 2022 10:59:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: imx: remove code for non-existing config
 IMX_GPT_ICAP
Message-ID: <Y33SxLh9xD8fQHAo@kadam>
References: <20221122132330.30408-1-lukas.bulwahn@gmail.com>
 <20221122160937.GB39395@tom-ThinkPad-T14s-Gen-2i>
 <CAKXUXMxk-YoG4TdB8Em+cEMF8NA7rdMAboQz8nmhfVmVQ8oATA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKXUXMxk-YoG4TdB8Em+cEMF8NA7rdMAboQz8nmhfVmVQ8oATA@mail.gmail.com>

On Wed, Nov 23, 2022 at 08:56:06AM +0100, Lukas Bulwahn wrote:
> 
> Strangely, my checkpatch invocation on next-20221116 did not show that
> warning and I am unaware that I made any specific changes to
> checkpatch or its configuration.
> 

I think you need to apply the patch and retest with the -f option.

regards,
dan carpenter

