Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8658C229B02
	for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750324796; cv=none; b=pb2r+tbjF7abS6OGhLy3k6rEagCMtSEaQxrGknHgD8JYy7jC8V0jPPzdJnIP/2xLkEuVixW5DN3uEDNfUA25HKHVhK+dAQpFer/SMcYpfKx7kLKl6xKruZfNatO5l9y0/X7X3SGsONaw+Zz2tuNfM+DEPjz6mdZP+LGRLE3EDPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750324796; c=relaxed/simple;
	bh=wUOEYdhZ29SHwGl/xTkaVOq2FWv4Ct0fQwiuoKhEtis=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=TCfhcTAaAsDE2Gc8ziWBquf7wlcMQEIuijw0s6IS3BcX8HxJy93znSyWjFjUrw+BB1FdO4/ELMwYmsCIo5EJkx/22jT6kOFecY7PddmnQPUuEOFqwgjw6s/PuCX+bvZdrh3ny1zuzfUVu7Wd3Ik2mmEvCkkr8iNUR7e8v6ql1Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a7cb5UVs; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a7cb5UVs"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b2fcd6fe970so96162a12.3
        for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 02:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750324795; x=1750929595; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:subject:from:reply-to:content-language
         :to:user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v/4YlE3HAl9brMdxqBP04WkjP+nK0l6GdDNJGUg3hDA=;
        b=a7cb5UVsjxSswe6mGVCFZQsZCXA1c2XlgqgQi7Nv76Ky00EOHQ6HLdAJweqIud8YlC
         +kS2bydEM7YSLBxYmvJ/Y5zMGHzuhd8Yw/wezjj9cJF96JmvaeYKJJ+JcDnXRRQxq2th
         nLY+1EXCqihhKV4PcOnXsjK2g8YnTto/yRiE/BSGC0ayjWxvAiwTvddw0cwwzlS3ClPW
         /oOCy6PGg+HPWEM0WYFbm/mDLYkxRydKcxxx7NK21aEPKr3zjDS4D9ntGQm1PinbViGN
         f+j9w1uciFvclra9LORHA7hwMEIkn/VnfINViGjD/fDLcLiNJ/JXcct4gX1RUXJkFWUy
         IinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750324795; x=1750929595;
        h=content-transfer-encoding:cc:subject:from:reply-to:content-language
         :to:user-agent:mime-version:date:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v/4YlE3HAl9brMdxqBP04WkjP+nK0l6GdDNJGUg3hDA=;
        b=f5yMuFl/OJS6qideo8SPQ75KypN5++KUTeEuD5I6k4v/IJviWr147YKX58Z4MfBv7f
         nU/HkqVUb7nux0dc9JY7c4zaFTDwyvPGqm6jnqoC9Df3k9qwAjdK9ULw/61nn1+oW1fK
         mHiCSjqrETfj+Y/TNG74ctDjtol5DyjUEOwzY/rl1Af+PaF1i8XUGAypXuP8QhKyK6V+
         j0VJ/+b1QaPb9ZZAuWfrg1Atzezs3cbyIrH1JtWEApYo7towtQ4gjAeCF9tH7UlPcgz1
         wARRxr30/9yGCURovSBkcz9HPtvW8JKLkaIlXEQHbvUtRSKWA04OkLa/2LZh/wa9UvwF
         K/Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVhJfJHvrBvQXtpSbd0bgWl8VGlcvGfQxAbXteW6ISz82s3gKbz2mN6RQig3WW2C0wA4/J3Nu5p48dT+CS5@lists.linux.dev
X-Gm-Message-State: AOJu0YwpC6aWNB+6tcpGS72PiX5tj153wugi3uomTSIeY6QNPUlY4de7
	wQ0ukcJUn97gSzF7+/Yp7z64+yO3K4zWHJrQH4CdR/yt+BtJPV0auwSxAHIAIPEUefsYMEUi
X-Gm-Gg: ASbGnctzTUMWq0FlxSwyLX2p1+/miw0UPiKv039EjpoxIPk5RZ7ILpmLqDlLB4BUIoO
	CFJDL+edzTG3H7aq99WM0M0BxrwvNQHJJhPTj1LPkEDYvHWu8QrgSo1s+5r4Kck0I54N0oZCnlo
	7dlF6yc+PftyJjzWkJbet7K1qUOH/X98gNC/2bRaG3JfSWwhqMCb87B9wRVjIXxpXkS6mbq4c4o
	7w7/Fdbd/5l6ttv2QhSvbk45E79xix5V9r+fDhnoVxv/BgM64oFtx8Yzy9dX8BJWq3DywEMUrOo
	VyIklVv6nDHCkp9/JrHK01S99vkL4imchPucZHiY+KAz6JpSb4xzOA==
X-Google-Smtp-Source: AGHT+IEOwVnmlW8HJGJmZZDAcMv1C94tin+GyGqBRrpDOir6cIrcvjw4rGkN6VVwGeWeSc86EeXQ9w==
X-Received: by 2002:a17:902:c40f:b0:22e:6d69:1775 with SMTP id d9443c01a7336-2368edfcb64mr66047925ad.11.1750324794607;
        Thu, 19 Jun 2025 02:19:54 -0700 (PDT)
Received: from [0.0.0.0] ([2a09:bac1:3b40:120::16:1d2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3157a615170sm2229196a91.0.2025.06.19.02.19.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 02:19:53 -0700 (PDT)
Message-ID: <9f098eab-7b98-4827-8538-3cab0e8d7c63@gmail.com>
Date: Thu, 19 Jun 2025 17:19:32 +0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: detlev.casanova@collabora.com
Content-Language: en-US
Reply-To: 20250325213303.826925-5-detlev.casanova@collabora.com
From: Jianfeng Liu <liujianfeng1994@gmail.com>
Subject: Re: [PATCH v4 4/6] media: rockchip: Introduce the rkvdec2 driver
Cc: alchark@gmail.com, andrzej.p@collabora.com, cassel@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.perchanov@intel.com,
 dsimic@manjaro.org, ezequiel@vanguardiasur.com.ar,
 gregkh@linuxfoundation.org, heiko@sntech.de, hverkuil@xs4all.nl,
 jacopo.mondi@ideasonboard.com, jeanmichel.hautbois@ideasonboard.com,
 jonas@kwiboo.se, kernel@collabora.com, kieran.bingham@ideasonboard.com,
 krzk+dt@kernel.org, laurent.pinchart@ideasonboard.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev, Jianfeng Liu <liujianfeng1994@gmail.com>,
 mchehab@kernel.org, naush@raspberrypi.com, nicolas.dufresne@collabora.com,
 robh@kernel.org, sakari.ailus@linux.intel.com,
 sebastian.reichel@collabora.com, tomi.valkeinen@ideasonboard.com,
 umang.jain@ideasonboard.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Detlev,

On Tue, 25 Mar 2025 17:22:20 -0400, Detlev Casanova wrote:

 >+        case RKVDEC2_ALLOC_SRAM:
 >+            virt_addr = (unsigned long)ctx->rcb_bufs[i].cpu;
 >+
 >+            iommu_unmap(rkvdec->iommu_domain, virt_addr, rcb_size);

I'm testing your patch with ffmpeg patched with v4l2-request patches[1], 
and I usually

get kernel panic here. After checking rkvdec->iommu_domain before 
running iommu_unmap,

I can pass fluster ffmpeg v4l2-request test. Here is my patch based on 
your commit:


diff --git a/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c 
b/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
index 75768561399..122bcdcebd4 100644
--- a/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
+++ b/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
@@ -681,8 +681,8 @@ static void rkvdec2_free_rcb(struct rkvdec2_ctx *ctx)
                 switch (ctx->rcb_bufs[i].type) {
                 case RKVDEC2_ALLOC_SRAM:
                         virt_addr = (unsigned long)ctx->rcb_bufs[i].cpu;
-
-                       iommu_unmap(rkvdec->iommu_domain, virt_addr, 
rcb_size);
+                       if (rkvdec->iommu_domain)
+ iommu_unmap(rkvdec->iommu_domain, virt_addr, rcb_size);
                         gen_pool_free(ctx->dev->sram_pool, virt_addr, 
rcb_size);
                         break;
                 case RKVDEC2_ALLOC_DMA:


[1] https://github.com/amazingfate/FFmpeg/commits/n6.1.1-new-patches/


Best regards,

Jianfeng

