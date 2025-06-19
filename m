Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EB01AA782
	for <linux-staging@lists.linux.dev>; Thu, 19 Jun 2025 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344002; cv=pass; b=mOFzzHfYrtuaWu69o/JLuwLJBKhIqsTanLisHv7gfaPl+hIO+YWzVp/c+ydye9Z3+PcC44e9HdnNDnkBRUzuv0f4dc+KrdoSlOEQhYQQd6vu/IIliuZkm79h6TKAZTaoyL4pgyDPU7aQJscogF2QoiedK4AMIiNRJhIUZkxyhjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344002; c=relaxed/simple;
	bh=rK9LNZ1uJ6FW1BZOrH8A8uJsqEt1nVlYhcicpVTZzhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NV66eO4FFXUEP9MQAFW0Bfcqzs3C43W59arTbNsOr3OpBq75V/emYpKshpd0dVnVKZ4I1WpLKSOj8gGHVNmccCyO44KoeuHK+bHWjb5UnhbjEUCFMcxVWCLSKxPGAUcPijZ5vZQq2VnduM5tMfTtOwf49uSTx/vo5Sdvz4XxY3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=Rw2gd+L5; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="Rw2gd+L5"
ARC-Seal: i=1; a=rsa-sha256; t=1750343956; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Jym2lPGxuOQzgAgSAE/A8rLETWESPaEFQYYyJGHONlYevNnFsA2UCWYhu0ZeL8itUV0dlh8hFb1v5rjRnaU3RQcByUMtiYZDNHuNYI1ForkWRFD4FLfls4QVP8LQmzKVCSUDaZBd3kQPQPGIg61txn/lwGvkdLvgF83rn8DvDR4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750343956; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lNxJSadVSJIRvaEmHMmUT8LLkdzhpjlPoa29IPSlJho=; 
	b=jErUqMNfobSAURiuvn13ZoGuHAb4QH8CiYdQERN3EDIDIEtBzoflfMW8B39oEAj7TFmbOE144dMFF9NpV6vKNQGg8SUsvVfc0lw6hy1kNZwuSyLRQqU8bJ4+jTVqD/64MphOE/GfCupsO0HAzb0bSF49tfU+zKuFBEDkLaLanoo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750343956;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=lNxJSadVSJIRvaEmHMmUT8LLkdzhpjlPoa29IPSlJho=;
	b=Rw2gd+L5lImASQ1HKgHlzcgdsRLZ18+fXxNa6EGGKYSlvhX9ynLQE5rW4eASp7v8
	QSbt2xeWyFdiZqGauT9ggxvclqc3XQMXBdqBBY89CArgt0gRcogHqNAXvikkSAitbSg
	dggkYGnqm53ErY31QUUd0D2pOjqYGY9Xq+wJk8Yg=
Received: by mx.zohomail.com with SMTPS id 175034395251629.953100317805934;
	Thu, 19 Jun 2025 07:39:12 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: 20250325213303.826925-5-detlev.casanova@collabora.com
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
Subject: Re: [PATCH v4 4/6] media: rockchip: Introduce the rkvdec2 driver
Date: Thu, 19 Jun 2025 10:39:08 -0400
Message-ID: <5900973.DvuYhMxLoT@trenzalore>
In-Reply-To: <9f098eab-7b98-4827-8538-3cab0e8d7c63@gmail.com>
References: <9f098eab-7b98-4827-8538-3cab0e8d7c63@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Jianfeng,

This patch set is now a  bit outdated. I will soon send a new version that you 
can find at [1].
That being said, you may be right. without an iommu, it would panic here 
(although the iommu should really be used).

[1]: https://gitlab.collabora.com/detlev/linux/-/tree/add-vdpu381-and-383-to-rkvdec

Regards,
Detlev

On Thursday, 19 June 2025 05:19:32 EDT Jianfeng Liu wrote:
> Hi Detlev,
> 
> On Tue, 25 Mar 2025 17:22:20 -0400, Detlev Casanova wrote:
>  >+        case RKVDEC2_ALLOC_SRAM:
>  >+            virt_addr = (unsigned long)ctx->rcb_bufs[i].cpu;
>  >+
>  >+            iommu_unmap(rkvdec->iommu_domain, virt_addr, rcb_size);
> 
> I'm testing your patch with ffmpeg patched with v4l2-request patches[1],
> and I usually
> 
> get kernel panic here. After checking rkvdec->iommu_domain before
> running iommu_unmap,
> 
> I can pass fluster ffmpeg v4l2-request test. Here is my patch based on
> your commit:
> 
> 
> diff --git a/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> b/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> index 75768561399..122bcdcebd4 100644
> --- a/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> +++ b/drivers/media/platform/rockchip/rkvdec2/rkvdec2.c
> @@ -681,8 +681,8 @@ static void rkvdec2_free_rcb(struct rkvdec2_ctx *ctx)
>                  switch (ctx->rcb_bufs[i].type) {
>                  case RKVDEC2_ALLOC_SRAM:
>                          virt_addr = (unsigned long)ctx->rcb_bufs[i].cpu;
> -
> -                       iommu_unmap(rkvdec->iommu_domain, virt_addr,
> rcb_size);
> +                       if (rkvdec->iommu_domain)
> + iommu_unmap(rkvdec->iommu_domain, virt_addr, rcb_size);
>                          gen_pool_free(ctx->dev->sram_pool, virt_addr,
> rcb_size);
>                          break;
>                  case RKVDEC2_ALLOC_DMA:
> 
> 
> [1] https://github.com/amazingfate/FFmpeg/commits/n6.1.1-new-patches/
> 
> 
> Best regards,
> 
> Jianfeng




