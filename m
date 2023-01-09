Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30CC28E8
	for <linux-staging@lists.linux.dev>; Mon,  9 Jan 2023 11:03:04 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id az7so7749410wrb.5
        for <linux-staging@lists.linux.dev>; Mon, 09 Jan 2023 03:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zefo0+cIWrVM5FFfr0NEPPr+QlP+S4JK9M0A8dYdzso=;
        b=oGr26Y/fiwHYFqrJohN/Z+dunayrmT0xuC0ParAo9r2mbdlha7JmZ5TehQNI7/mIWp
         hWSaPL393d7ahA2QrXLa47EcjFnu5YT3Jb1N9fthnTAQrjCxXX5POnD6hWqlfRrvA5rI
         D/zve+wX42+oAgMs/sBQZoe1LdpaOjZRMLxj9/pt72r0tOe0R/+AjRzibKCDbZ/OAUkz
         Q0BxMJI//BsazsVVwnI2dgwGh987r5dh+ydGEkKrBjeM7d2rKYJ1AA6ZN5E5Avw5UebQ
         EnTIpNqs1kyVGp6yaaqvQXZQzoIn0NGA/pp6hh/yoW71e/0duhXVOBRms7rLUxGdJdLd
         s8Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zefo0+cIWrVM5FFfr0NEPPr+QlP+S4JK9M0A8dYdzso=;
        b=yj8CuHJahvfx5ZkCD6AjpukPRwXXHY9BRudSvROFffiLqVeWN93a8KHxE4VveboJo6
         xNhGcllT5CZkKqgrjCv7SYeHv2caWzt7N5GCa/qmNKTWXeiv4SWXk6XUkugj9wXkKneX
         LMXdcEC0awlQ2KoGZ32JH01TZvLAUBrRSrK8OS523J3lWcmpR8oEevEJf1suXT6GDg21
         XjZ2L7ripK8I9NCED5LPd8E7Ml8EwC1AD6JKaJGB1cM5oXKzboZMrA2FMRLq6R5kSLmC
         //1CXqYlXMkTODonwcCNetHyJKIapN2mT+kKC9WPpPeai8K5sjC3zE2H0fguf2VNvi5v
         3q/g==
X-Gm-Message-State: AFqh2koCnr36VMukSfM3oinP7HLPQpHoYCZc6DyzI3M+tqnUAVAx/p4S
	wvZo7ldOGHigXUeGgyRXfTbBcQ==
X-Google-Smtp-Source: AMrXdXuJ229PsMqnsutJQhmCnDx582UTxhRGjYEWDOJCs8UDfbNlBoANEOulxPZfAp5vzNYgBBmlzA==
X-Received: by 2002:a5d:56cb:0:b0:28d:66c4:3102 with SMTP id m11-20020a5d56cb000000b0028d66c43102mr23679733wrw.12.1673262182985;
        Mon, 09 Jan 2023 03:03:02 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d58ce000000b002879c013b8asm8250053wrf.42.2023.01.09.03.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:03:02 -0800 (PST)
Date: Mon, 9 Jan 2023 11:02:59 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: sam@ravnborg.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Helge Deller <deller@gmx.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Antonino Daplas <adaplas@gmail.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Robin van der Gracht <robin@protonic.nl>,
	Miguel Ojeda <ojeda@kernel.org>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-staging@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 13/15] backlight: omap1: Use backlight helpers
Message-ID: <Y7v0Yw3kg9E8j5Bu@aspen.lan>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-13-1bd9bafb351f@ravnborg.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230107-sam-video-backlight-drop-fb_blank-v1-13-1bd9bafb351f@ravnborg.org>

On Sat, Jan 07, 2023 at 07:26:27PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> From: Sam Ravnborg <sam@ravnborg.org>
>
> Rework backlight handling to avoid access to the deprecated
> backlight_properties.fb_blank member.
>
> The rework includes removal of get_brightness() operation,
> because there was no read back from HW so no use for it.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Daniel Thompson <daniel.thompson@linaro.org>
> Cc: Jingoo Han <jingoohan1@gmail.com>

This rework will result in additional calls to omapbl_send_enable()
during updates so, if anyone who cares about omap1, is filtering LKML
then a Tested-by: would be nice.

However, I doubt the additional calls will do any harm so even with
that absent:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
