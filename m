Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86F7466;
	Sun, 15 Oct 2023 16:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="lIeIBbn9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1697387932; bh=pYockNRZjc2dNPr8vNuS5tNYZ7arbBBQ8q6BRdmWjPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lIeIBbn9rTNW7IEL7TMs5zHhkSPHaODkBbeWfKvqBsDgIlBEK4cRZqCHVxL9gwJ7B
	 PLdgjQW7Q+WWrzX1HOrK1SPF+EJrC5BvyEazKfCzFtZ1lzS0hupaVEOVsVYVo8ylZ+
	 lr81mcFwhN/kvgKysKyCMr+NigcWylk/w3yoix7U=
Date: Sun, 15 Oct 2023 18:38:52 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Calvince Otieno <calvncce@gmail.com>
Cc: gustavo@embeddedor.com, outreachy@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: wlan-ng: remove unused function prototypes
Message-ID: <d6204b3b-9a6c-425b-8915-9feb36526f5f@t-8ch.de>
References: <ZSv2ObWLvlbM2hXn@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSv2ObWLvlbM2hXn@lab-ubuntu>

Hi Calvince,

On 2023-10-15 17:24:57+0300, Calvince Otieno wrote:
> These functions are declared but not defined or used anywhere.
> Their definitions were removed 15 years ago in the
> commit cbec30c4c00c ("Staging: wlan-ng: Delete a large pile of
> now-unused code.")

The indicated commit seems to be incorrect for prism2mgmt_set_grpaddr().

Also for new versions of patches it is useful to explicitly Cc people
that commented on the previous versions. These people people may be
curious about the progress and it makes it easier for the patch to
receive a Reviewed-by from them.

Plus the points from the document linked by Greg's bot.

* Changelog compared to previous version.
* Increment of patch version counter in subject
(* Link to previous version of patch in lore.kernel.org)

> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
>  drivers/staging/wlan-ng/prism2mgmt.h | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/prism2mgmt.h b/drivers/staging/wlan-ng/prism2mgmt.h
> index 083a055ee986..8c3f1ac35913 100644
> --- a/drivers/staging/wlan-ng/prism2mgmt.h
> +++ b/drivers/staging/wlan-ng/prism2mgmt.h
> @@ -78,14 +78,6 @@ void prism2mgmt_pstr2bytestr(struct hfa384x_bytestr *bytestr,
>  void prism2mgmt_bytestr2pstr(struct hfa384x_bytestr *bytestr,
>  			     struct p80211pstrd *pstr);
>  
> -/* functions to convert Group Addresses */
> -void prism2mgmt_get_grpaddr(u32 did, struct p80211pstrd *pstr,
> -			    struct hfa384x *priv);
> -int prism2mgmt_set_grpaddr(u32 did,
> -			   u8 *prism2buf, struct p80211pstrd *pstr,
> -			   struct hfa384x *priv);
> -int prism2mgmt_get_grpaddr_index(u32 did);
> -
>  void prism2sta_processing_defer(struct work_struct *data);
>  
>  void prism2sta_commsqual_defer(struct work_struct *data);
> -- 
> 2.34.1
> 
