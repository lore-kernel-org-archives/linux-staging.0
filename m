Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F420F5
	for <linux-staging@lists.linux.dev>; Fri, 24 Mar 2023 05:07:37 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id t10so3223404edd.12
        for <linux-staging@lists.linux.dev>; Thu, 23 Mar 2023 22:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679634455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kBpxI4lGzunQIJcTy0Wu60h6ZsBAWmGxZxQSmX0uFmQ=;
        b=EUSWzn6kHwgbDhoo68XHhAg2Km/vibAMCcf3/FHKHBcyfjpQ9PhqlpKupia4Mtxlkj
         Buyk3QeYClCwEqj3nKDNBescvQcwVvvG5mOSn9/Rxm0Y9yHTPKSTlZsg0WU/igxOSPIu
         btNe/pNLQmR5cDCcask/GvXK/cyFTI/NpzsF7OC1uon6INA1kJSdO2JgL/Iz9E91VXtp
         Y1NplCTXqYQgC9hlMDiAblNhl4N9yo97qe6+ar/R0K1XprWQMiXQ4e8Nd3dBCXsOFpJi
         BBZYQc+adidRJJG5ZemojxGuPdbSxJO69A9OWCLLrjHefEvH7cm5S1/ayhYQyYMxBf2v
         P0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679634455;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBpxI4lGzunQIJcTy0Wu60h6ZsBAWmGxZxQSmX0uFmQ=;
        b=Fx7oWbGqRtokVS7S+386zgYEBQuJufNuwLuUNrvgWvJ93ADmC+M9lG5/nRsp2opgeI
         kVkko+HrMu0I8bTTLjEHARP7uEzbHcP6spvEs+ffPmutsgXJm+uIhWFii/1zl4RdfKHf
         7obx+AtUPzE90sBDxmmC6+KdWi4SejDNaQmNLmWKriXV4oaes9Ytmva64uuE7i9VManU
         jK/D3zc9fEiZ0Z/HEKluew8ImbSyOgtCn4W0IwrGFZvnv0WfbD6Bo00NwuRhzWRM0azO
         s9McLhq5pxTV1DA6Z8C/OXphog9aShw7UGaeKlWsVFIe2AG2Ee60JUCeylazNEnSlH7V
         GFMA==
X-Gm-Message-State: AAQBX9dnxEJq0RoMOjzW2lV57sPLcEnsY9h6E4gAEnrLcb2dUOSwBDT0
	ooKvcDm+Ov94BP3BPBHwlxXwzeLr5/RKzg==
X-Google-Smtp-Source: AKy350YHAfuyqcama1ziPT02mzs5ARITreG3BtRax/9FGKFg+vur48ALmQTAGS+oUfTIwEsXhAOU9g==
X-Received: by 2002:a17:906:dc7:b0:92b:7e6a:bca0 with SMTP id p7-20020a1709060dc700b0092b7e6abca0mr1334015eji.14.1679634455222;
        Thu, 23 Mar 2023 22:07:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id gt6-20020a170906f20600b0092a3b199db8sm9486968ejb.186.2023.03.23.22.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 22:07:34 -0700 (PDT)
Date: Fri, 24 Mar 2023 08:07:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexander Heinrich <hallo@alexanderheinrich.de>
Cc: gregkh@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] Correct code style according to Linux guildelines
Message-ID: <5f8ff690-4b26-42d8-b405-f815a240fb46@kili.mountain>
References: <20230323194611.299241-1-hallo@alexanderheinrich.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323194611.299241-1-hallo@alexanderheinrich.de>

1: The subject doesn't have a patch prefix and is generally not in the
   correct format.

On Thu, Mar 23, 2023 at 08:46:11PM +0100, Alexander Heinrich wrote:
> This patch fixes the following warning produced by checkpatch.pl,
> when run on drivers/staging/wlan-ng/p80211req.c.
> 
> CHECK: Unnecessary parentheses around
>     'msg->msgcode != DIDMSG_DOT11REQ_MIBGET'

2: Add a blank line here, before the signed-off-by line.

> Signed-off-by: Alexander Heinrich <hallo@alexanderheinrich.de>
> ---
>  drivers/staging/wlan-ng/p80211req.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wlan-ng/p80211req.c b/drivers/staging/wlan-ng/p80211req.c
> index 809cf3d480e9..df2d07304d1c 100644
> --- a/drivers/staging/wlan-ng/p80211req.c
> +++ b/drivers/staging/wlan-ng/p80211req.c
> @@ -125,7 +125,7 @@ int p80211req_dorequest(struct wlandevice *wlandev, u8 *msgbuf)
>  
>  	/* Check Permissions */
>  	if (!capable(CAP_NET_ADMIN) &&
> -	    (msg->msgcode != DIDMSG_DOT11REQ_MIBGET)) {
> +	    msg->msgcode != DIDMSG_DOT11REQ_MIBGET) {

3: Greg likes these parentheses so just ignore checkpatch on this.
   (Don't resend this one, find something else to clean up).

regards,
dan carpenter

