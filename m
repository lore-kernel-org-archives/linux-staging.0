Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D170
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 12:40:51 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id i18so1181084wrm.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 05:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BNYUKZHrMhvTPOFQ1droPRgbVu7CLrkiY6RX4hkaSxA=;
        b=CinOx2ahgmQnkhPg+emJ4c/OIpkUqWOEydyPkQdaHZpOZEL65VFQkeDeF62HQQ9PJb
         D6LvQeUI2Ae66hMZeBJMxGRKUuP/FaQctBCXvS9e3Rfwhsn74Ixpp1cqiXnbCLZOT5gT
         +N1AFKV8Ajm+JkS/RYARcwy/fbnUf6zkzXt+kF60+UTIdAdrT9I1pEFGru4IREQjgd7c
         oQcaPAdDz6Dp5jpvApK/BB1Wf709gn8/iVJi6QwFIJM3KvJ5fhu0+wkmHP9dbCnwNE1Q
         KtDrOxYUwlrzLtO9d7pLasOKBqwEHzcA/oQR4m7qGFrEKS5H8TyscuC+BSWG34C65IOC
         XkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BNYUKZHrMhvTPOFQ1droPRgbVu7CLrkiY6RX4hkaSxA=;
        b=FC82yKg5bnyjxAcozTi9ljoZTdMo4nG6fybCkYLChUFlU+2JbVpHKZjaF1OxQCA/0l
         xr7Rck56iHyEdpTSwe1OLJsWNv0ELbjSkWQLrqAuIEIYttHdrmO5WFT35RhG+GatUB+E
         hGVxJU9bLbBlabBMw5viFZbJVD3VJwYuLhR5PQhBxR2WhbR8AczVNXsNLwhbQhBpvEyJ
         nqpTHlMn01pTTAzbAxW4BlsnpvT8N1df2RQBjjGbQCjY9vaLZ62Lnfu3qSM+iLo1Jv/Q
         pJIwT+xa+gBsvZ1b6+LMTKk+woX4WisSkZcArYdAiXKyl76PmULQMEEP5RZUyQgpS1he
         kqNA==
X-Gm-Message-State: AOAM530Akvobf01bje8ktJIS+v3xigYORiLl6ULKBlifivWrcjLGIaP8
	gQFayfTpUpHtYOuoqSQ/43M=
X-Google-Smtp-Source: ABdhPJyXhFmNwuFZ6RiAxeiFyk6B8myjdOkmCJxAqUQpfnwijxF6oZR1CxQgtGANwyulpgEgDum4lQ==
X-Received: by 2002:adf:ea0c:: with SMTP id q12mr2517845wrm.2.1617367249808;
        Fri, 02 Apr 2021 05:40:49 -0700 (PDT)
Received: from agape.jhs ([5.171.80.213])
        by smtp.gmail.com with ESMTPSA id k11sm12342998wmj.1.2021.04.02.05.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 05:40:49 -0700 (PDT)
Date: Fri, 2 Apr 2021 14:40:46 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: gregkh@linuxfoundation.org, joe@perches.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/16] staging: rtl8723bs: remove RT_TRACE logs in
 core/rtw_xmit.c
Message-ID: <20210402124045.GA1420@agape.jhs>
References: <cover.1617356821.git.fabioaiuto83@gmail.com>
 <72ab5222629f912ca2dbe825d194108992d321e7.1617356821.git.fabioaiuto83@gmail.com>
 <20210402115626.GV2088@kadam>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210402115626.GV2088@kadam>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Apr 02, 2021 at 02:56:26PM +0300, Dan Carpenter wrote:
> On Fri, Apr 02, 2021 at 12:01:21PM +0200, Fabio Aiuto wrote:
> > @@ -568,20 +561,11 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
> >  	if (pattrib->encrypt > 0)
> >  		memcpy(pattrib->dot118021x_UncstKey.skey, psta->dot118021x_UncstKey.skey, 16);
> >  
> > -	RT_TRACE(_module_rtl871x_xmit_c_, _drv_info_,
> > -		("update_attrib: encrypt =%d  securitypriv.sw_encrypt =%d\n",
> > -		pattrib->encrypt, padapter->securitypriv.sw_encrypt));
> > -
> >  	if (pattrib->encrypt &&
> > -		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false))) {
> > +		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
> 
> You've done too much clean up here.  Just remove the { but leave the
> == true/false comparisons.
> 
> If the patch is only changing five lines or code then fixing checkpatch
> warnings on the line of code you are changing is fine, but in this case
> you're doing a bunch of changes and these sort of cleanups make it hard
> to review.
> 
> Ease to spot that the curly brace changed:
> -		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false))) {
> +		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false)))
> 
> Hard to spot:
> -		((padapter->securitypriv.sw_encrypt == true) || (psecuritypriv->hw_decrypted == false))) {
> +		((padapter->securitypriv.sw_encrypt) || (!psecuritypriv->hw_decrypted)))
> 
> regards,
> dan carpenter
> 

thank you Dan, it's a good tuning process for me. Shall I resend the
whole patchset? Maybe some of them are ok...

fabio
