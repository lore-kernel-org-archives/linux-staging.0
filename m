Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 332203481
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 06:05:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193675158"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193675158"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2021 23:05:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="583790282"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2021 23:05:48 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
	by paasikivi.fi.intel.com (Postfix) with SMTP id BFF0B203BC;
	Mon,  2 Aug 2021 09:05:46 +0300 (EEST)
Date: Mon, 2 Aug 2021 09:05:46 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-kernel@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-hardening@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2 1/2] media: staging/intel-ipu3: css: Fix wrong size
 comparison
Message-ID: <20210802060546.GL3@paasikivi.fi.intel.com>
References: <cover.1627646101.git.gustavoars@kernel.org>
 <184d96f95d6261b1a91704eb68adbd0a2e1c2cc2.1627646101.git.gustavoars@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <184d96f95d6261b1a91704eb68adbd0a2e1c2cc2.1627646101.git.gustavoars@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Gustavo,

I missed you already had sent v2...

On Fri, Jul 30, 2021 at 07:08:13AM -0500, Gustavo A. R. Silva wrote:
> There is a wrong comparison of the total size of the loaded firmware
> css->fw->size with the size of a pointer to struct imgu_fw_header.
> 
> Fix this by using the right operand 'struct imgu_fw_header' for
> sizeof, instead of 'struct imgu_fw_header *' and turn binary_header
> into a flexible-array member. Also, adjust the relational operator
> to be '<=' instead of '<', as it seems that the intention of the
> comparison is to determine if the loaded firmware contains any
> 'struct imgu_fw_info' items in the binary_header[] array than merely
> the file_header (struct imgu_fw_bi_file_h).
> 
> The replacement of the one-element array with a flexible-array member
> also help with the ongoing efforts to globally enable -Warray-bounds
> and get us closer to being able to tighten the FORTIFY_SOURCE routines
> on memcpy().
> 
> Link: https://github.com/KSPP/linux/issues/79
> Link: https://github.com/KSPP/linux/issues/109
> Fixes: 09d290f0ba21 ("media: staging/intel-ipu3: css: Add support for firmware management")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
> 
> It'd be just great if someone that knows this code better can confirm
> these changes are correct. In particular the adjustment of the
> relational operator. Thanks!
> 
> Changes in v2:
>  - Use flexible array and adjust relational operator, accordingly.

The operator was just correct. The check is just there to see the firmware
is at least as large as the struct as which it is being accessed.

>  - Update changelog text.
> 
>  drivers/staging/media/ipu3/ipu3-css-fw.c | 2 +-
>  drivers/staging/media/ipu3/ipu3-css-fw.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.c b/drivers/staging/media/ipu3/ipu3-css-fw.c
> index 45aff76198e2..630cb5186b48 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-fw.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-fw.c
> @@ -124,7 +124,7 @@ int imgu_css_fw_init(struct imgu_css *css)
>  	/* Check and display fw header info */
>  
>  	css->fwp = (struct imgu_fw_header *)css->fw->data;
> -	if (css->fw->size < sizeof(struct imgu_fw_header *) ||
> +	if (css->fw->size <= sizeof(struct imgu_fw_header) ||
>  	    css->fwp->file_header.h_size != sizeof(struct imgu_fw_bi_file_h))
>  		goto bad_fw;
>  	if (sizeof(struct imgu_fw_bi_file_h) +
> diff --git a/drivers/staging/media/ipu3/ipu3-css-fw.h b/drivers/staging/media/ipu3/ipu3-css-fw.h
> index 3c078f15a295..c0bc57fd678a 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-fw.h
> +++ b/drivers/staging/media/ipu3/ipu3-css-fw.h
> @@ -171,7 +171,7 @@ struct imgu_fw_bi_file_h {
>  
>  struct imgu_fw_header {
>  	struct imgu_fw_bi_file_h file_header;
> -	struct imgu_fw_info binary_header[1];	/* binary_nr items */
> +	struct imgu_fw_info binary_header[];	/* binary_nr items */
>  };
>  
>  /******************* Firmware functions *******************/

-- 
Regards,

Sakari Ailus
