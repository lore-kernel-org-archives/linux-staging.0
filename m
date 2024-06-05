Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06D318C32B
	for <linux-staging@lists.linux.dev>; Wed,  5 Jun 2024 07:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717571579; cv=none; b=V4QDTwMD+iTV49qWlLA6B3oRA1WF85LtraBYXIaNxPJgamwIaw+St/P3iHbe2/ijgDvABuuhym2YRdLw7e2XatCg7VKKN0+1Mku5vATSaYQesqiWbm+OUm29ZmtjP3vCnIDvVbafeayzAiWudUVB42k1mmZAILVSthfEenVAwdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717571579; c=relaxed/simple;
	bh=cRNE5JUdVxvzPAxHq5ZQiOaexJX4QjssUpPimLhh9/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7uFOlR0B5UUREob0j/aQPUxSC0VwemIuR7UDQiQ08bUazgoNfURdH3CWFgNWrVCGFGsXb+l1TqZyvjsQ/s2w5eJT1WzdaBR9oYH3G2Henr95hHjvq2vBTsMR6Y9k79XEO0QAYTjt9eT/aTL+uBDRpi2QziUQX1v0ubrcGNQEQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YBh+0glQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YBh+0glQ"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FCD5BEB;
	Wed,  5 Jun 2024 09:12:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1717571568;
	bh=cRNE5JUdVxvzPAxHq5ZQiOaexJX4QjssUpPimLhh9/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBh+0glQE+c1JG8FD7gTQthyvi8Ol0JzgvKjFMVmOtfPGfc8LjkxMiIT5iraF2XLP
	 r++0EwEYB2FvMoB1VHsMf0JGRK3/4IazVAqdllt9gUMDcEUEOn9oCQmeJjZqb8mOtj
	 ahLiA8I1801XDnnLNt42u0ck3BKvAM5bHYHTpdNk=
Date: Wed, 5 Jun 2024 10:12:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 10/11] staging: vchiq_core: Add hex prefix to debugfs
 output
Message-ID: <20240605071240.GH879@pendragon.ideasonboard.com>
References: <20240604172904.61613-1-wahrenst@gmx.net>
 <20240604172904.61613-11-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240604172904.61613-11-wahrenst@gmx.net>

Hi Stefan,

Thank you for the patch.

On Tue, Jun 04, 2024 at 07:29:03PM +0200, Stefan Wahren wrote:
> The number format of VCHIQ debugfs isn't always clear. So let's
> add a prefix for all hex values, in order to make things clear.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../vc04_services/interface/vchiq_arm/vchiq_core.c        | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> index 51cfc366519b..4f65e4021c4d 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
> @@ -3370,7 +3370,7 @@ vchiq_dump_shared_state(struct seq_file *f, struct vchiq_state *state,
>  	};
>  	int i;
> 
> -	seq_printf(f, "  %s: slots %d-%d tx_pos=%x recycle=%x\n",
> +	seq_printf(f, "  %s: slots %d-%d tx_pos=0x%x recycle=0x%x\n",
>  		   label, shared->slot_first, shared->slot_last,
>  		   shared->tx_pos, shared->slot_queue_recycle);
> 
> @@ -3386,7 +3386,7 @@ vchiq_dump_shared_state(struct seq_file *f, struct vchiq_state *state,
>  	}
> 
>  	for (i = 1; i < shared->debug[DEBUG_ENTRIES]; i++) {
> -		seq_printf(f, "    DEBUG: %s = %d(%x)\n",
> +		seq_printf(f, "    DEBUG: %s = %d(0x%x)\n",
>  			   debug_names[i], shared->debug[i], shared->debug[i]);
>  	}
>  }
> @@ -3414,7 +3414,7 @@ vchiq_dump_service_state(struct seq_file *f, struct vchiq_service *service)
> 
>  			if (service->public_fourcc != VCHIQ_FOURCC_INVALID)
>  				scnprintf(remoteport + len2, sizeof(remoteport) - len2,
> -					  " (client %x)", service->client_id);
> +					  " (client 0x%x)", service->client_id);
>  		} else {
>  			strscpy(remoteport, "n/a", sizeof(remoteport));
>  		}
> @@ -3475,7 +3475,7 @@ void vchiq_dump_state(struct seq_file *f, struct vchiq_state *state)
>  	seq_printf(f, "State %d: %s\n", state->id,
>  		   conn_state_names[state->conn_state]);
> 
> -	seq_printf(f, "  tx_pos=%x(@%pK), rx_pos=%x(@%pK)\n",
> +	seq_printf(f, "  tx_pos=0x%x(@%pK), rx_pos=0x%x(@%pK)\n",
>  		   state->local->tx_pos,
>  		   state->tx_data + (state->local_tx_pos & VCHIQ_SLOT_MASK),
>  		   state->rx_pos,

-- 
Regards,

Laurent Pinchart
