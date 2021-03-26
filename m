Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37A25F
	for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 08:24:47 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id g25so2545296wmh.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 01:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P69SLlUM6Wpqbc3ZZlqMWRJNFFy2Iddkt2N7eFlc+9w=;
        b=k88lTt0VD0lSluyrqOy2ibxjHfIytbeZhAMOyEtFf2CtGie5JWebZTuMWmr96nC9ou
         sZmzXDtnQ7al0LG/3vzxh5kWwo7f7g2llGDiFgPXH5Jyhtl8iW8LzQX4jjbmg5lA78ZN
         yfdwVU8HtG22PR2l3uLzOSXCL9gevkrWK0T3n5tkCtPnF0Jxd6P35e7fZeGytcGjfc5j
         2gJjhql+pytBatgQ8oRKGcigIgzsY5OXLHFLeaYizwXUJA5Lt7JLxCFDrsSoSTdmB5Zc
         J8qSHXf0DxKYT0fDFQt+4fzGlAPTWADF0CPl2yLfE5LAZthKnx24OKFkbJ+k0mkKXaj9
         zC4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P69SLlUM6Wpqbc3ZZlqMWRJNFFy2Iddkt2N7eFlc+9w=;
        b=uFFKK0w6A2lxcWsFx2haHnNit6/q+7c8LJ77wu1HXM8p9bxoL9nL6ja7kKef6DXR/u
         ZnqW7HLQwtLUrotNIo3eJZz+k8Rfoh1fAzj2D+2db7z3WVMaBuJOadmA8WiypVQNixpG
         IcYgvrT1IFGURMT1HfPTSBARlfT14ec+ONxdzM6BBIr2dCyxmkYDOFaE+v2zRX/BCqMA
         4PUP09O3XqbQhyN0euXsVW0cJpKTmgW1PsTp0B3VXp4NwW1/iiyz2nRey89YUFTdxmtM
         tc8UU9iMqvOsHVxCnUwqKC/spNTP6NRvL6iyKZVIsth9U7r/7iRQXqR0V/LuyCQCjt6l
         UrPA==
X-Gm-Message-State: AOAM532Bw8rUlAq/PkiyJ/LIq6a1gvQss/70/koiaUtMEOdomr4JdiIf
	xIjNWQAwUl81E5rZOoiv684=
X-Google-Smtp-Source: ABdhPJxGhQczg1zFLlot95FoX2E34iL4vqvUGBLYRD2ru4s1iyXtsesCr1140T8FWvYXHWzhi5x1vQ==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr11741400wmi.170.1616747086427;
        Fri, 26 Mar 2021 01:24:46 -0700 (PDT)
Received: from agape.jhs ([5.171.81.75])
        by smtp.gmail.com with ESMTPSA id 91sm11721673wrl.20.2021.03.26.01.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 01:24:46 -0700 (PDT)
Date: Fri, 26 Mar 2021 09:24:43 +0100
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-staging@lists.linux.dev
Subject: Re: [bug report] staging: rtl8723bs: remove unused code blocks
 conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*
Message-ID: <20210326082442.GA1452@agape.jhs>
References: <YFxQSJXXQ4dFPGS4@mwanda>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFxQSJXXQ4dFPGS4@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Mar 25, 2021 at 11:56:40AM +0300, Dan Carpenter wrote:
> Hello Fabio Aiuto,
> 
> The patch 65f183001f6e: "staging: rtl8723bs: remove unused code
> blocks conditioned by never set CONFIG_INTERRUPT_BASED_TXBCN*" from
> Mar 16, 2021, leads to the following static checker warning:
> 
> 	drivers/staging/rtl8723bs/core/rtw_ap.c:911 start_bss_network()
> 	warn: inconsistent indenting
> 
> drivers/staging/rtl8723bs/core/rtw_ap.c
>    904                  rtw_get_capability((struct wlan_bssid_ex *)pnetwork)
>    905          );
>    906  
>    907          if (pmlmeext->bstart_bss) {
>    908                  update_beacon(padapter, WLAN_EID_TIM, NULL, true);
>    909  
>    910          /* issue beacon frame */
> 
> The patch accidentally deleted these extra tab for this block.
> 
>    911          if (send_beacon(padapter) == _FAIL)
>    912                  DBG_871X("issue_beacon, fail!\n");
>    913  
>    914          }
>    915  
>    916          /* update bc/mc sta_info */
>    917          update_bmc_sta(padapter);
>    918  
> 
> regards,
> dan carpenter

Thank you Dan,

sent yesterday a fix,

sorry for late,

fabio
