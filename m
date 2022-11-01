Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2491C1843;
	Tue,  1 Nov 2022 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=V6n2MWOOY0pZymd4oI7C3sh0yOHwVS9t/O1/Ve2U86c=;
  b=iJhovUMRxnlYU7s9ovRxCni5GeoF71yAaxNNqL1NVoxvHC/+Fwgioc7d
   Upt8+wJ4uLADBi+txphErOkCuGqpKjJtSGwOXrv9PhJmUuOA55aQ8+Zar
   77uUwzxk/5IbfNtiDdPeM7cPGYYAa3Vml3Cy14tiFnzA5ANi9lsCUn+bD
   A=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,230,1661810400"; 
   d="scan'208";a="36170295"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2022 12:32:49 +0100
Date: Tue, 1 Nov 2022 12:32:48 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH 1/2] change the function name s_vFillRTSHead
In-Reply-To: <16e1033e32dd5a82e058c7c69ea2ec93800a30b7.1667300134.git.tanjubrunostar0@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2211011232260.2834@hadrien>
References: <cover.1667300134.git.tanjubrunostar0@gmail.com> <16e1033e32dd5a82e058c7c69ea2ec93800a30b7.1667300134.git.tanjubrunostar0@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Tue, 1 Nov 2022, Tanjuate Brunostar wrote:

> Remove the use of Hungarian notation, which is not used in the Linux
> kernel

Period at the end of the sentence.  It woudl still be good to acknowledge
checkpatch.

julia

>
> Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
> ---
>  drivers/staging/vt6655/rxtx.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
> index 31ae99b3cb35..d7e439cd8675 100644
> --- a/drivers/staging/vt6655/rxtx.c
> +++ b/drivers/staging/vt6655/rxtx.c
> @@ -23,7 +23,7 @@
>   *      s_uGetTxRsvTime- get frame reserved time
>   *      s_vFillCTSHead- fulfill CTS ctl header
>   *      s_vFillFragParameter- Set fragment ctl parameter.
> - *      s_vFillRTSHead- fulfill RTS ctl header
> + *      fill_rts_head- fulfill RTS ctl header
>   *      s_vFillTxKey- fulfill tx encrypt key
>   *      s_vSWencryption- Software encrypt header
>   *      vDMA0_tx_80211- tx 802.11 frame via dma0
> @@ -85,15 +85,15 @@ static const unsigned short fb_opt1[2][5] = {
>  #define DATADUR_A_F1    13
>
>  /*---------------------  Static Functions  --------------------------*/
> -static void s_vFillRTSHead(struct vnt_private *pDevice,
> -			   unsigned char byPktType,
> -			   void *pvRTS,
> -			   unsigned int	cbFrameLength,
> -			   bool bNeedAck,
> -			   bool bDisCRC,
> -			   struct ieee80211_hdr *hdr,
> -			   unsigned short wCurrentRate,
> -			   unsigned char byFBOption);
> +static void fill_rts_head(struct vnt_private *pDevice,
> +			  unsigned char byPktType,
> +			  void *pvRTS,
> +			  unsigned int	cbFrameLength,
> +			  bool bNeedAck,
> +			  bool bDisCRC,
> +			  struct ieee80211_hdr *hdr,
> +			  unsigned short wCurrentRate,
> +			  unsigned char byFBOption);
>
>  static void s_vGenerateTxParameter(struct vnt_private *pDevice,
>  				   unsigned char byPktType,
> @@ -912,7 +912,7 @@ s_vGenerateTxParameter(
>  			buf->rrv_time_a = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
>  			buf->rrv_time_b = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, pDevice->byTopCCKBasicRate, bNeedACK);
>
> -			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> +			fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
>  		} else {/* RTS_needless, PCF mode */
>  			struct vnt_rrv_time_cts *buf = pvRrvTime;
>
> @@ -931,7 +931,7 @@ s_vGenerateTxParameter(
>  			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, byPktType, cbFrameSize, wCurrentRate, bNeedACK);
>
>  			/* Fill RTS */
> -			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> +			fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
>  		} else if (!pvRTS) {/* RTS_needless, non PCF mode */
>  			struct vnt_rrv_time_ab *buf = pvRrvTime;
>
> @@ -945,7 +945,7 @@ s_vGenerateTxParameter(
>  			buf->rrv_time = vnt_rxtx_rsvtime_le16(pDevice, PK_TYPE_11B, cbFrameSize, wCurrentRate, bNeedACK);
>
>  			/* Fill RTS */
> -			s_vFillRTSHead(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
> +			fill_rts_head(pDevice, byPktType, pvRTS, cbFrameSize, bNeedACK, bDisCRC, psEthHeader, wCurrentRate, byFBOption);
>  		} else { /* RTS_needless, non PCF mode */
>  			struct vnt_rrv_time_ab *buf = pvRrvTime;
>
> --
> 2.34.1
>
>
>
