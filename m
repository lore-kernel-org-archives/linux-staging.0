Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C684D2FAD
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 12:58:46 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id h9so12774246ejs.4
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 05:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dei5ldbSnuAmJj+eoYruR4aeAYZ4EbbJLELMi4p7lTI=;
        b=XkkT/XqAUqWQaj5lpIpXSlVZUEzqkkFIgeL5OhjylY6iDEULaq3AKrsvwhBPsRZJsO
         eLtLSZs2mndaBcNR8NDtoGYBW9VhtI8NJvg/hR8Q28pP+346Zt3JK/9W1KXtVb4GiY1T
         ScBiNuKChINddmnm2dUiSNGv5A2AL+4j7Ky8EMHj8y5gi3IMpIqKPSwSSOefPdptUiJs
         0Rs8tWwJFmsEj3sFuH1OyPJ4hHZWlm6aRToUWJWkGQFgYYbX5iR1NwwLURLenaflzhnd
         FhENqRMYK2aJw4Z4NWNL5sN9PGcwTeDzxgKoJUPBlnr14SGSQS8i49UlP5p9bEz0MYt6
         0zYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dei5ldbSnuAmJj+eoYruR4aeAYZ4EbbJLELMi4p7lTI=;
        b=hcH93NQ/Vjv6KCGwwmsvPcwLV/n+yiSRUDONFYELXdwURYhYVXghwKa6XAv6qYhV4k
         5/0BA4IuSWEBBbMr4aPWdux+sevc31+U5mmWZfFe9G1JTwzrFiMBrp6asdXLaUpRgNsA
         fdePF89IEO4vkMUuugYTfzimR5yWmNW5kPVgiVJMx7kgN+0sb/DYWf6b0x7VWErkqWDN
         CmV1Y5dQMsd05r2C69MOzC8ErA6AGQqd3tNFbyns76elbVC302nFsxK242rTuXiVD5/0
         BecYs5ItSrN0voTzbGNeVOYh2cs11DCl8pKt5M75nSEoZmZdH56Z37mDDBFcxsuF5yGT
         Dyjw==
X-Gm-Message-State: AOAM532/L6K+macWMa8rrk/zcrUhJNLvOZgEQjQP+Tr03edrd7r2GFnv
	d+6ihr9Coq92XWMmcxqZbtg=
X-Google-Smtp-Source: ABdhPJyQ8Z0kwxKKTLUi+tZ5wfjG/lnPAZNOc3VWUaPbRlubKaezYE3/1wMSfOflW8qQSUZSqktnrQ==
X-Received: by 2002:a17:906:d045:: with SMTP id bo5mr15820830ejb.461.1629377925177;
        Thu, 19 Aug 2021 05:58:45 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id s7sm1722713edu.23.2021.08.19.05.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 05:58:44 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, Aakash Hemadri <aakashhemadri123@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] staging: r8188eu: cast to restricted __be32
Date: Thu, 19 Aug 2021 14:58:43 +0200
Message-ID: <1640197.nFQ5q36Eve@localhost.localdomain>
In-Reply-To: <602aefc30b0d979dc6e402d52da2f096ea5c67cf.1629360917.git.aakashhemadri123@gmail.com>
References: <cover.1629360917.git.aakashhemadri123@gmail.com> <602aefc30b0d979dc6e402d52da2f096ea5c67cf.1629360917.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, August 19, 2021 10:17:54 AM CEST Aakash Hemadri wrote:
> Fix sparse warning:
> > rtw_br_ext.c:836:54: warning: cast to restricted __be32
> 
> Unnecessary double cast, remove them.

Are you sure that you had a *double* cast?
In the line that you changed I see only a cast and a swap 
(or, better, a potential swap).

Regards,

Fabio

> 
> Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
> ---
>  drivers/staging/r8188eu/core/rtw_br_ext.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
> index 404fa8904e47..6a0462ce6230 100644
> --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> @@ -671,7 +671,7 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
>  				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
>  					struct dhcpMessage *dhcph =
>  						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
> -					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
> +					u32 cookie = dhcph->cookie;
>  
>  					if (cookie == DHCP_MAGIC) { /*  match magic word */
>  						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
> -- 
> 2.32.0
> 
> 
> 




