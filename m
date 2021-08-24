Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6283FC0
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 16:14:05 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id u7so21057823ilk.7
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 09:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=pcNnf4TxbCMwJQkTkhqRCzKNEEMPfx1pXl202ukoYGQ=;
        b=mMHPTBuONnlG4LvpO4a1FsWIOqfasPr+DCJ1b2b1oww0Doha7B+FSHixyppjb0Cg3r
         ibIy93AERKP0UaRxiabCjISh7a+o95fpI/PTASEnCgdLRCtOlEFEK60gEGf2LCdlaJEH
         tZvexAyDk+9vlWhG8fB+wvTTVo04YsvYo2v+t+of8r4PfoeoaN+fW6L6iD3ie88JORcf
         96xZO2Qd3w0tueG79B24ODEOLZwR7oGFN9iCsjAHMfurWAYbKtT8YsvO/Wtz+aW+BkKs
         QPYmPsU8380DK90NHA4CAlko3kvMXs59KuVs1ysdvpy6fYKHrOXMwqVLsTB7DCE/W3AE
         ZWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pcNnf4TxbCMwJQkTkhqRCzKNEEMPfx1pXl202ukoYGQ=;
        b=p3ZQ6q04L4TcSBnXL3Qu+S1TM21hIq0BpP6elSftTXoF/kbses5kJaD/E/XGJYm+5R
         zzpMQn92nljPHmQ6V8Q7YfqF/J/ohM+phFW1OTJL/5XcH1uYiIZVyOGGLD0uPKRgGtih
         QhpcwI1IWcYKs5Zh7kb/t9W0WwTtOTCQfxhSHmfOBeisoUO75Xg4YhWoNJ2zIMTOMXUx
         tctNZfAphubl91SNosCaCLE2XO619woPGEbGdm06ZpCIHI0Jr6EoC+CaRyqz7OkWsbGd
         o0QYBx1iMGvODqqCtnLZ0M+Wr6hs4PLMl33TyW2u6/iA+S9MwOyz89nMIqis/re7XjzM
         Yg3A==
X-Gm-Message-State: AOAM5318H78MX6OFP0sVi6H0eD79fRGFtsEvMpxRR2Uh/MEPzIx8oMBL
	1dhnVLfa5m1FhaYBO6MB15jHcQ==
X-Google-Smtp-Source: ABdhPJy+V5gZ9FmDs7jYArv7vTabyzXewlSDUiWaGmmtaEP+jAb2Ew/GIOHWu+r5X7P1bvxdrvzC4w==
X-Received: by 2002:a92:7b0c:: with SMTP id w12mr27810105ilc.307.1629821645129;
        Tue, 24 Aug 2021 09:14:05 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (mtl.collabora.ca. [66.171.169.34])
        by smtp.gmail.com with ESMTPSA id g13sm9730524ile.68.2021.08.24.09.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 09:14:04 -0700 (PDT)
Message-ID: <4c39862321d81708ead108e2f96cc36f563378fa.camel@ndufresne.ca>
Subject: Re: [PATCH 25/30] v4l: videodev2: Add 10bit definitions for NV12
 and NV16 color formats
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: sidraya.bj@pathpartnertech.com, gregkh@linuxfoundation.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: prashanth.ka@pathpartnertech.com, praneeth@ti.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, praveen.ap@pathpartnertech.com
Date: Tue, 24 Aug 2021 12:14:02 -0400
In-Reply-To: <20210818141037.19990-26-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
	 <20210818141037.19990-26-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le mercredi 18 août 2021 à 19:40 +0530, sidraya.bj@pathpartnertech.com a écrit :
> From: Sidraya <sidraya.bj@pathpartnertech.com>
> 
> The default color formats support only 8bit color depth. This patch
> adds 10bit definitions for NV12 and NV16.
> 
> Signed-off-by: Sunita Nadampalli <sunitan@ti.com>
> Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
>  include/uapi/linux/videodev2.h       | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 05d5db3d85e5..445458c15168 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1367,6 +1367,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_VIVID:       descr = "Vivid Metadata"; break;
>  	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
>  	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
> +	case V4L2_PIX_FMT_TI1210:       descr = "10-bit YUV 4:2:0 (NV12)"; break;
> +	case V4L2_PIX_FMT_TI1610:       descr = "10-bit YUV 4:2:2 (NV16)"; break;
>  
>  	default:
>  		/* Compressed formats */
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9260791b8438..a71ffd686050 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -737,6 +737,8 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /* Sunxi Tiled NV12 Format */
>  #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
>  #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
> +#define V4L2_PIX_FMT_TI1210   v4l2_fourcc('T', 'I', '1', '2') /* TI NV12 10-bit, two bytes per channel */
> +#define V4L2_PIX_FMT_TI1610   v4l2_fourcc('T', 'I', '1', '6') /* TI NV16 10-bit, two bytes per channel */

As we try and avoid past mistakes (consider HM12 and Sunxi Tiled format as an
example), what makes your pixel format 100% TI specific ? The only valid answer
is usually compression or a very odd pixel arrangement that only makes sense for
a specific HW, in any case, please provide all the information you can about
this format (tiling pattern, block size, compression is any). This way we can
judge if allocating  a vendor format actually make sense. It would be sad if
this turns out to be just another 16x16 tiled format (yes, we have multiple
already).

From past experience with OMAP, TI CODECs uses linear tiling very similar to all
other platforms, if that is the case, it should be added a generic format with
with enough documentation for a third party to understand it. Of course, if any
of the HW specification in this regard is public, please share or link to the
related documents.

>  
>  /* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
>  #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
> -- 
> 2.17.1
> 
> 


