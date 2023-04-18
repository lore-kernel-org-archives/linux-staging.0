Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1824C2572
	for <linux-staging@lists.linux.dev>; Tue, 18 Apr 2023 13:04:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525A0C433D2;
	Tue, 18 Apr 2023 13:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1681823048;
	bh=4Ph/dFwCh9YbMeZnsdIGgxesneSIpcLjZKhHXRORa2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbLiBOxxVnaMhKnJIAulfc/O7AxPU5onlOAJFLo/K1ahf+ZbMlOQNQSnGPnsgO9+J
	 Uul/XnZGWbZCzYhSZBp8s25GVE3fzGiEf4PtUwMCsDb+ZQFfT041GNFtZlPrARIouP
	 Itcsm0Ggsa+rxlgM3eHDYQ/xiGOrp5rM3Gd8F2Sw=
Date: Tue, 18 Apr 2023 15:04:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luke Koch <lu.ale.koch@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: wlan-ng: replace rate macros
Message-ID: <2023041809-wildfowl-winter-be08@gregkh>
References: <ZD6OqBOp1ezQDgMu@kernelhacking.kernelhacking.example.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZD6OqBOp1ezQDgMu@kernelhacking.kernelhacking.example.com>

<note, your Reply-To: is very odd, please fix your email client up...>

On Tue, Apr 18, 2023 at 02:35:52PM +0200, Luke Koch wrote:
> Change p80211msg_dot11req_scan_results rate members to struct arrays
> instead of individually numbered member structs.
> Replace macros to set rates with loops to avoid checkpatch warning
> and adhere to linux coding style.
> 
> Reported by checkpatch:
> 
> CHECK: Macro argument reuse 'N' - possible side-effects?
> 
> Signed off by: Luke Koch <lu.ale.koch@gmail.com>
> ---
> v2: - Fix array underflow and conditions with respect to the start at 0
> v3: - Remove unnecessary spaces
> ---
>  drivers/staging/wlan-ng/p80211metastruct.h | 18 +-------
>  drivers/staging/wlan-ng/prism2mgmt.c       | 52 +++++++---------------
>  2 files changed, 18 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/p80211metastruct.h b/drivers/staging/wlan-ng/p80211metastruct.h
> index 4adc64580185..e963227f797c 100644
> --- a/drivers/staging/wlan-ng/p80211metastruct.h
> +++ b/drivers/staging/wlan-ng/p80211metastruct.h
> @@ -114,22 +114,8 @@ struct p80211msg_dot11req_scan_results {
>  	struct p80211item_uint32 cfpollreq;
>  	struct p80211item_uint32 privacy;
>  	struct p80211item_uint32 capinfo;
> -	struct p80211item_uint32 basicrate1;
> -	struct p80211item_uint32 basicrate2;
> -	struct p80211item_uint32 basicrate3;
> -	struct p80211item_uint32 basicrate4;
> -	struct p80211item_uint32 basicrate5;
> -	struct p80211item_uint32 basicrate6;
> -	struct p80211item_uint32 basicrate7;
> -	struct p80211item_uint32 basicrate8;
> -	struct p80211item_uint32 supprate1;
> -	struct p80211item_uint32 supprate2;
> -	struct p80211item_uint32 supprate3;
> -	struct p80211item_uint32 supprate4;
> -	struct p80211item_uint32 supprate5;
> -	struct p80211item_uint32 supprate6;
> -	struct p80211item_uint32 supprate7;
> -	struct p80211item_uint32 supprate8;
> +	struct p80211item_uint32 basicrate[8];
> +	struct p80211item_uint32 supprate[8];
>  } __packed;
>  
>  struct p80211msg_dot11req_start {
> diff --git a/drivers/staging/wlan-ng/prism2mgmt.c b/drivers/staging/wlan-ng/prism2mgmt.c
> index 9030a8939a9b..fc465261baa1 100644
> --- a/drivers/staging/wlan-ng/prism2mgmt.c
> +++ b/drivers/staging/wlan-ng/prism2mgmt.c
> @@ -437,42 +437,22 @@ int prism2mgmt_scan_results(struct wlandevice *wlandev, void *msgp)
>  		if (item->supprates[count] == 0)
>  			break;
>  
> -#define REQBASICRATE(N) \
> -	do { \
> -		if ((count >= (N)) && DOT11_RATE5_ISBASIC_GET(	\
> -			item->supprates[(N) - 1])) { \
> -			req->basicrate ## N .data = item->supprates[(N) - 1]; \
> -			req->basicrate ## N .status = \
> -				P80211ENUM_msgitem_status_data_ok; \
> -		} \
> -	} while (0)
> -
> -	REQBASICRATE(1);
> -	REQBASICRATE(2);
> -	REQBASICRATE(3);
> -	REQBASICRATE(4);
> -	REQBASICRATE(5);
> -	REQBASICRATE(6);
> -	REQBASICRATE(7);
> -	REQBASICRATE(8);
> -
> -#define REQSUPPRATE(N) \
> -	do { \
> -		if (count >= (N)) {					\
> -			req->supprate ## N .data = item->supprates[(N) - 1]; \
> -			req->supprate ## N .status = \
> -				P80211ENUM_msgitem_status_data_ok; \
> -		} \
> -	} while (0)
> -
> -	REQSUPPRATE(1);
> -	REQSUPPRATE(2);
> -	REQSUPPRATE(3);
> -	REQSUPPRATE(4);
> -	REQSUPPRATE(5);
> -	REQSUPPRATE(6);
> -	REQSUPPRATE(7);
> -	REQSUPPRATE(8);
> +	for (int i = 0; i < 8; i++) {
> +		if (count > i &&
> +		    DOT11_RATE5_ISBASIC_GET(item->supprates[i])) {
> +			req->basicrate[i].data = item->supprates[i];
> +			req->basicrate[i].status =
> +				P80211ENUM_msgitem_status_data_ok;
> +		}
> +	}
> +
> +	for (int i = 0; i < 8; i++) {
> +		if (count > i) {
> +			req->supprate[i].data = item->supprates[i];
> +			req->supprate[i].status =
> +				P80211ENUM_msgitem_status_data_ok;
> +		}
> +	}

This patch implies that these structures are set but never actually read
from, so why are they present at all?  Is this a structure that is on
the wire/air or used somewhere else as an api to hardware?

I tried to unwind things in the driver, but couldn't figure it out, what
happens if you just delete these fields, does the driver still work
properly?

thanks,

greg k-h
