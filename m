Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138D15A8;
	Thu, 14 Apr 2022 01:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649898602; x=1681434602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nrVy/pMBQUhIH7JlrxEFjgxSXFkQPYIxiQnDRWzKmFc=;
  b=Av3RpB8fIwfAO8T/2QCkFWRyCwkQx6pLeaTA+dYatYuMZTKIHr64suOA
   wBWjN09TTfDpNXrAfmJ4f60e6TaoyeN4B56IkE49Y2CuSpTRPZ1WNNNo1
   8w/vwW0YtcCjc8omRUkJtsWVkibmZPiigm2/1fQOaHNc7Zh79LusoTAkR
   vZM19Z0qOkZMunX1By9/gEQOys3v7ABTv6KpDWoPwHYDR+TIQ9KTyG1FA
   JzXvhvP3HHuFtryG+Kq523qWS4H35LnbkimyMcp1QvhD9vkqZo4XO08AE
   +et4NgLd20SYdq5vpHAiaTkv7/3OtKJxHeTNxKqcyxeL4jvnZpwEBt9by
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="349252656"
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="349252656"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 18:10:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,258,1643702400"; 
   d="scan'208";a="527176188"
Received: from alison-desk.jf.intel.com (HELO alison-desk) ([10.54.74.41])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2022 18:10:01 -0700
Date: Wed, 13 Apr 2022 18:11:56 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Aliya Rahmani <aliyarahmani786@gmail.com>
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: sm750fb: Remove volatile
Message-ID: <20220414011156.GA1243803@alison-desk>
References: <20220413203914.59533-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413203914.59533-1-aliyarahmani786@gmail.com>

On Thu, Apr 14, 2022 at 02:09:15AM +0530, Aliya Rahmani wrote:

Hi Aliya,

Wondering why the recipient list different than this:

$ perl scripts/get_maintainer.pl --nogit-fallback --no-rolestats -f drivers/staging/sm750fb/sm750.h
Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Teddy Wang <teddy.wang@siliconmotion.com>
Greg Kroah-Hartman <gregkh@linuxfoundation.org>
linux-fbdev@vger.kernel.org
linux-staging@lists.linux.dev
linux-kernel@vger.kernel.org


> Remove volatile to fix checkpatch.pl warning.
> 
> Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
> index aff69661c8e6..7a11f8593596 100644
> --- a/drivers/staging/sm750fb/sm750.h
> +++ b/drivers/staging/sm750fb/sm750.h
> @@ -52,7 +52,7 @@ struct lynx_accel {
>  	/* base virtual address of DPR registers */
>  	volatile unsigned char __iomem *dprBase;
>  	/* base virtual address of de data port */
> -	volatile unsigned char __iomem *dpPortBase;
> +	unsigned char __iomem *dpPortBase;
>  
>  	/* function pointers */
>  	void (*de_init)(struct lynx_accel *accel);
> -- 
> 2.25.1
> 
> 
