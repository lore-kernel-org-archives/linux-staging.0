Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04EEE257B
	for <linux-staging@lists.linux.dev>; Thu, 15 Dec 2022 07:59:44 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h10so2183104wrx.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Dec 2022 23:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KX0PWE2xH1wSf/y+zwbZJi36dKHohqN+VlC//8Gj03Y=;
        b=CRXXChB9RPUbelebK5Wi627ibXjWXRYZrVQK9fV7JL2upp00d1sz8VO5aqxykceunt
         z6Waxut3u1vjPaKhvIs5yya2XbkvBN+azS6J1pViAiWoSwz21h7DqKd520x/txMPZ2o8
         seoMqz/JKzPxzKyooayFzlm03v1REqNISxqHdRCZg+2JTyjzVAKy2TBrAgafuwPjnobL
         3GLWti82hybD3IhVMxbQP7b0IJ2BSvsBrd2OAuRTIklJncrocTtiBv3TMV+Wa8NBGsZV
         xNX1p2t6WdXMyvg6LpMbSatM8M78rT9ZvbCLr6De19ezXIpPVukdRzNWm+YaJnydIPsN
         UV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KX0PWE2xH1wSf/y+zwbZJi36dKHohqN+VlC//8Gj03Y=;
        b=Wj9A6I+QQ4sUQs1wwLDAAa4fVaXeSDtWBfCIZisCABqL2nkfUyjovCDav3ACH/ABx1
         5uncr0gR8R20I7gbHHA+xed5DP5bKlc4pL8qFFjntPo1Kn8QgGlqnR5o/A/7Q126l5SD
         rmPRssWpC/mDG3qUpYmhTUGCErPkqm5yswoT1s5T3qcg7tHmSlLrjHAtziY+U4sKWyC8
         tQ3RkzrhnTkiq+lfFPaWErUEqIdw6aFIc7j5qBn92KoENHAhs4ceVlOluYoix5W1WjfR
         o2exd4AQdU1bLEoPXGejrR0AFLReuXT7uxx8piug0kpCuE32XlC4KMmB45uGVh4cQFVf
         PWKg==
X-Gm-Message-State: ANoB5pkUDvgB7mTpaWCZr7NVcSotgLflt+zuf2seKrMFgsDnlCS8ADDn
	BKCN33VNCTLh/+aeXYBuphQ=
X-Google-Smtp-Source: AA0mqf64n9wNAGf4SoZErGss2bZlF+akwx2ZmjXfqJnjEXlBPkfi6KoVksXeh4Nx+Kjh9mK3UgjFxg==
X-Received: by 2002:a5d:4e82:0:b0:242:7139:601a with SMTP id e2-20020a5d4e82000000b002427139601amr16180937wru.28.1671091183130;
        Wed, 14 Dec 2022 23:59:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h9-20020a5d5489000000b00242109cf587sm5134961wrv.28.2022.12.14.23.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 23:59:42 -0800 (PST)
Date: Thu, 15 Dec 2022 10:59:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Adrien Thierry <athierry@redhat.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 5/7] vc04_services: vchiq_arm: Drop VCHIQ_RETRY usage on
 disconnect
Message-ID: <Y5rT4qNDTCiVoHnu@kadam>
References: <20221215065853.34477-1-umang.jain@ideasonboard.com>
 <20221215065853.34477-6-umang.jain@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221215065853.34477-6-umang.jain@ideasonboard.com>

On Thu, Dec 15, 2022 at 12:28:51PM +0530, Umang Jain wrote:
> Drop the usage of VCHIQ_RETRY when the vchiq has connection status
> VCHIQ_CONNSTATE_DISCONNECTED. Disconnected is will not be valid to
> carry on a retry, replace the VCHIQ_RETRY with -EINVAL.
> 
> This patch removes the usage of vCHIQ_RETRY completely and act as
> intermediatory to address the TODO item:
> 	* Get rid of custom function return values
> for vc04_services/interface.
> 
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---

It sounds like this should have a Fixes tag because the original
behavior was wrong.

regards,
dan carpenter

