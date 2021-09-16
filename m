Received: from smtprelay.hostedemail.com (smtprelay0219.hostedemail.com [216.40.44.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF0B3FC3
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 20:53:11 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave01.hostedemail.com (Postfix) with ESMTP id F06C8182371AA
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 11:24:37 +0000 (UTC)
Received: from omf15.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay08.hostedemail.com (Postfix) with ESMTP id 51539182CF666;
	Thu, 16 Sep 2021 11:24:31 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf15.hostedemail.com (Postfix) with ESMTPA id 1650DC4190;
	Thu, 16 Sep 2021 11:24:28 +0000 (UTC)
Message-ID: <4197af5dfc99650e01bd4aacb776c5be9b795814.camel@perches.com>
Subject: Re: [PATCH 3/7] staging: vchiq_arm: clarify multiplication
 expressions
From: Joe Perches <joe@perches.com>
To: Gaston Gonzalez <gascoar@gmail.com>, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, nsaenz@kernel.org, stefan.wahren@i2se.com, 
 arnd@arndb.de, dan.carpenter@oracle.com, ojaswin98@gmail.com, 
 amarjargal16@gmail.com, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,  linux-kernel@vger.kernel.org
Date: Thu, 16 Sep 2021 04:24:27 -0700
In-Reply-To: <20210915201824.413202-3-gascoar@gmail.com>
References: <20210915201824.413202-1-gascoar@gmail.com>
	 <20210915201824.413202-3-gascoar@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.11
X-Stat-Signature: 544ueume7b44rqkoammscrdxq1p9crw3
X-Rspamd-Server: rspamout02
X-Rspamd-Queue-Id: 1650DC4190
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/jXw/7d8P9VGTIZTO9ZcXYXwOL860FHv4=
X-HE-Tag: 1631791468-112681

On Wed, 2021-09-15 at 17:18 -0300, Gaston Gonzalez wrote:
> Add spaces around '*' in multiplication expressions to enhance
> readability.
[]
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
[]
> @@ -466,8 +466,8 @@ int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
>  
>  	g_free_fragments = g_fragments_base;
>  	for (i = 0; i < (MAX_FRAGMENTS - 1); i++) {
> -		*(char **)&g_fragments_base[i*g_fragments_size] =
> -			&g_fragments_base[(i + 1)*g_fragments_size];
> +		*(char **)&g_fragments_base[i * g_fragments_size] =
> +			&g_fragments_base[(i + 1) * g_fragments_size];
>  	}
>  	*(char **)&g_fragments_base[i * g_fragments_size] = NULL;

unrelated:

These '*(char **)&' uses are odd and thankfully rare constructs.



