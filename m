Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69710360
	for <linux-staging@lists.linux.dev>; Tue,  6 Jun 2023 05:28:35 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f623adec61so57936455e9.0
        for <linux-staging@lists.linux.dev>; Mon, 05 Jun 2023 22:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686029313; x=1688621313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJOXSF88DjPrnCYvhp794YSBiOIag1Qb+70cCdfwYxU=;
        b=kPBHfTSe+3iTgyI53dScjnFVlv+5aI5Dq2IL68wZAwPflgnKzBa09ymP0f7PGhDCZX
         CrqY3Jlrpz2aX1JIXn/3FX+D/nRO2hcfOZI6PaMbbOlNIMoNvzO305kQaMJaAWjpH7Gx
         PWfaDq871RrRGMSrPWtOSI5GOstsH9UNXUegz2AVPdcc0DYDa7SVK0V2LhLq1rCL5/Rj
         CMEm+84URhyrfyZ4zlxBlxDZxstC+d5zEMsTVICDBCOK/OToigswOLCtsiFJoA3NjumT
         iPH6Uo0dSBFMa9CA0dMPHfyM9TtnsdladS07MzE+lJnRjEP1u6Mzt6XLhlioBaAXsvtO
         wCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686029313; x=1688621313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJOXSF88DjPrnCYvhp794YSBiOIag1Qb+70cCdfwYxU=;
        b=DnKDKn9LLzrm8+Dy0GlCkJM6G5nRJTQbnyhKrkCqiWgkqTQcsGehrHgkP8fyPVSGE7
         8Ok8WKmvPcVDK6qChRBFbF6ZUDyLPM8JbTsgoa+pNNVAqqzj96oR11ihKEQuKTOY5Mzx
         rspLP82s354X6/cMoib25bT3e3jgLAgFD8nZDoOGVFNr6P0D8sCTnxoK0gV0RGLJUgN+
         563Gltm91OFBELxcgz/vto4+re9u7PLlQRy4PXqJIYdAPk2iPrn5+bzqMflULvPO7NtM
         fYpZ4PMMsJTQMHPqonqXE/BPxHcI6L0sEDWC3r56ZETL7lScApe40O0NWfI+0chwEA+O
         lRPw==
X-Gm-Message-State: AC+VfDzpvPuKbJOmdZkyUIIuuBAEpXTLiOl37hZ/ETni9/D8/PWtRZXb
	i2DeNxs+Cc+qbdvr4e3ga951Jg==
X-Google-Smtp-Source: ACHHUZ53mQ64foMYdD4WiJ9aXcXW/Mh9UVrYMszuUl5utsyKjRZqTF91fgc6UpYXQ5nOqZPoVHtjhQ==
X-Received: by 2002:a1c:770d:0:b0:3f4:2770:f7e9 with SMTP id t13-20020a1c770d000000b003f42770f7e9mr976047wmi.17.1686029313452;
        Mon, 05 Jun 2023 22:28:33 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id f4-20020a7bc8c4000000b003f7e717c770sm3198157wml.23.2023.06.05.22.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 22:28:31 -0700 (PDT)
Date: Tue, 6 Jun 2023 08:28:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, javierm@redhat.com, sam@ravnborg.org, deller@gmx.de,
	geert+renesas@glider.be, lee@kernel.org, daniel.thompson@linaro.org,
	jingoohan1@gmail.com, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 18/30] fbdev/radeonfb: Use hardware device as backlight
 parent
Message-ID: <f1bb576e-88cb-4c5d-a7a6-d45ffc48edb3@kadam.mountain>
References: <20230605144812.15241-1-tzimmermann@suse.de>
 <20230605144812.15241-19-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605144812.15241-19-tzimmermann@suse.de>

On Mon, Jun 05, 2023 at 04:48:00PM +0200, Thomas Zimmermann wrote:
> Use the hardware device in struct fb_info.device as parent of the
> backlight device. Aligns the driver with the rest of the codebase
> and prepares fbdev for making struct fb_info.dev optional.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Benjamin Herrenschmidt <benh@kernel.crashing.org>

You left out the Cc:

regards,
dan carpenter

