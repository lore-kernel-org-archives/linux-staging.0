Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAD82CAE;
	Tue,  7 Dec 2021 21:14:20 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id 7so939201oip.12;
        Tue, 07 Dec 2021 13:14:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=asvIIgcfdstNfjFsb5JYamSeC7BkZaM5BJh8bn9MdF4=;
        b=1w+sfGehhJSukke0h1AMz17MCazpGtaMi0QgC6pdmEwdZdYOJFc3+kcD4ClFxEwvAu
         wrBcvw6PMyl/WHnHmypA1DPj1dFQl7hI9faJNylQAVQwLCFC75j5HGgX5GyfOOL1fTZ0
         XTNdZSLa9DbDCD6BZ0FBYqxYCmnqymMUcc7tMsi+lDEY1lsNp8+f+ZBF2pg2Y5SAF0yH
         vjJuw0Sa1MFWAlUcMStbpen9laCqflTPYtUkKIBIU6ZHIfc+wexgwhwbVSUOeGfejqPk
         28l9R+V9NGCt67Wo97TVzEVUJT0VkYzRgKto3T6+A39nzco2YB4RBqVF0/lX/OL3pStl
         BqUA==
X-Gm-Message-State: AOAM533hDKxKrzPHpPqmr+pFu9eEQKvx92VLitO+vv+3+AFLZEays6KC
	DpuRzgx3eJTDleXlqsWPPg==
X-Google-Smtp-Source: ABdhPJxc/AHj+LnGGT6zJnz1p3C+dMtJOu6aTpY+Io5e+BMbWIEn0nwFat+1MwVmkTIt17nn/3xhGw==
X-Received: by 2002:a05:6808:11c6:: with SMTP id p6mr7741859oiv.44.1638911659363;
        Tue, 07 Dec 2021 13:14:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v19sm146773ott.13.2021.12.07.13.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 13:14:18 -0800 (PST)
Received: (nullmailer pid 842210 invoked by uid 1000);
	Tue, 07 Dec 2021 21:14:17 -0000
Date: Tue, 7 Dec 2021 15:14:17 -0600
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: andrzej.p@collabora.com, linux-staging@lists.linux.dev, linux-media@vger.kernel.org, gregkh@linuxfoundation.org, mchehab@kernel.org, ezequiel@vanguardiasur.com.ar, robh+dt@kernel.org, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, nicolas.dufresne@collabora.com, linux-kernel@vger.kernel.org, mripard@kernel.org, linux-sunxi@lists.linux.dev, wens@csie.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/9] media: dt-bindings: allwinner: document H6 Hantro
 G2 binding
Message-ID: <Ya/OqXg7vVKPwudd@robh.at.kernel.org>
References: <20211129182633.480021-1-jernej.skrabec@gmail.com>
 <20211129182633.480021-8-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211129182633.480021-8-jernej.skrabec@gmail.com>

On Mon, 29 Nov 2021 19:26:31 +0100, Jernej Skrabec wrote:
> Allwinner H6 contains older Hantro G2 core, primarly used for VP9 video
> decoding. It's unclear for now if HEVC is also supported.
> 
> Describe it's binding.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../media/allwinner,sun50i-h6-vpu-g2.yaml     | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun50i-h6-vpu-g2.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
