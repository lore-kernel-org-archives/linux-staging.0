Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE92636;
	Mon, 24 Oct 2022 04:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316E3C433C1;
	Mon, 24 Oct 2022 04:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666584471;
	bh=wqPgP+8gYHmK9GoieUKkAx4Z5kQUK7bHl56fCslFrUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aIxX1ej7uZtoW4nLSZBV5AQuSiOEwB1kMAgXMr95mJ3/m6kmXDSQOu0jyxLkKPAAi
	 onH2jWPn/F8urOxwynMLOsn1WG9sQgVAHDa3d/C/MDaMbU8xt0dTMvafILGDRa1scs
	 VTGKvaYlcOIXAtgIor7q4CBvmrMdXWxV3V+hti9E=
Date: Mon, 24 Oct 2022 06:08:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Deepak R Varma <drv@mailo.com>, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: wlan-ng: remove commented debug printk
 messages
Message-ID: <Y1YPypVbN5v18uni@kroah.com>
References: <Y1L0FiKvrM9jjZG9@debian-BULLSEYE-live-builder-AMD64>
 <Y1VDM2kWIi1I5dqI@debian.me>
 <Y1VL/wITM64U6qLi@kroah.com>
 <4863c6d7-ffdd-1304-981b-9b0644a87f4e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4863c6d7-ffdd-1304-981b-9b0644a87f4e@gmail.com>

On Mon, Oct 24, 2022 at 10:08:00AM +0700, Bagas Sanjaya wrote:
> On 10/23/22 21:13, Greg KH wrote:
> >>> @@ -1007,7 +986,6 @@ static int p80211_rx_typedrop(struct wlandevice *wlandev, u16 fc)
> >>>  			wlandev->rx.cfack_cfpoll++;
> >>>  			break;
> >>>  		default:
> >>> -			/* printk("unknown"); */
> >>>  			wlandev->rx.data_unknown++;
> >>>  			break;
> >>>  		}
> >>
> >> Shouldn't these printks be guarded under CONFIG_DEBUG_KERNEL instead?
> > 
> > No, they should just be removed as was done here.
> > 
> 
> What if in case of debugging without these printks?

I can not parse this line, sorry.
