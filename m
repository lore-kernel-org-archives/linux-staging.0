Received: from smtprelay.hostedemail.com (smtprelay0173.hostedemail.com [216.40.44.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAF3FC7
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 09:08:36 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave07.hostedemail.com (Postfix) with ESMTP id 0F5FF183F96CB
	for <linux-staging@lists.linux.dev>; Sat, 25 Sep 2021 08:32:18 +0000 (UTC)
Received: from omf20.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id A1A701840406A;
	Sat, 25 Sep 2021 08:32:10 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id B255318A612;
	Sat, 25 Sep 2021 08:32:08 +0000 (UTC)
Message-ID: <e70345785a0ffd019bdb769d6ac5f45c5549030a.camel@perches.com>
Subject: Re: [PATCH v3 1/3] staging: vt6655: replace camel case
 b_short_slot_time instead of bShortSlotTime.
From: Joe Perches <joe@perches.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Yujia Qiao <rapiz@foxmail.com>, Lucas
 Henneman <lucas.henneman@linaro.org>, Madhumitha Prabakaran
 <madhumithabiw@gmail.com>,  Marcos Antonio de Jesus Filho
 <mdejesusfilho@gmail.com>, Aldas =?UTF-8?Q?Tara=C5=A1kevi=C4=8Dius?=
 <aldas60@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Deepak
 R Varma <mh12gx2825@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sat, 25 Sep 2021 01:32:07 -0700
In-Reply-To: <20210925074531.10446-2-tomm.merciai@gmail.com>
References: <20210925074531.10446-1-tomm.merciai@gmail.com>
	 <20210925074531.10446-2-tomm.merciai@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.77
X-Stat-Signature: 7ossdcj131xwq5dwb9iqpk91sh1xgush
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: B255318A612
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18W0cFl2NZcQoH+7OKTIt+j7kjtXZj5Sag=
X-HE-Tag: 1632558728-591224

On Sat, 2021-09-25 at 09:45 +0200, Tommaso Merciai wrote:
> Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
[]
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
[]
> @@ -1440,9 +1440,9 @@ static void vnt_bss_info_changed(struct ieee80211_hw *hw,
> 
>  	if (changed & BSS_CHANGED_ERP_SLOT) {
>  		if (conf->use_short_slot)
> -			priv->bShortSlotTime = true;
> +			priv->b_short_slot_time = true;
>  		else
> -			priv->bShortSlotTime = false;
> +			priv->b_short_slot_time = false;

A simple assignment works

		priv->b_short_slot_time = conf->use_short_slot;


