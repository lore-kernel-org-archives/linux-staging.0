Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5080A5F
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 10:12:41 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id ap14so2112960ejc.0
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 03:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6lzW4BlsZetgCzXxUSanRsURtvah1swCuTO5rdJaayc=;
        b=cOGQRq6JAECo/E439aNxCpfYxchqSefixnlJyby+0LJFFl8urNEsPTi7pwj7xwpRaE
         KnO36R+PBqp+HAlC00jTY/SU74h292yR18GBGf41CMRNyMxkCd7DUYJ5urZRJ8fQUg0p
         c7XBX4s4x24Up1ARbUHJ0Qvrjvg8uzVz6yicKOCp4CW8HTiFxebe242yMWCOXKAX0y2v
         wkTWniGFaWb3YY8/gEatWHILsfpSa2JkuIJBc9m2EDz1CuKFYaFqiJJKlvBl9udIP3pP
         Qi0TI7YiCYfuoEtVc5hCsYYZ/thXxXUstpTSVUjQs7oyltNlUct70TSuAAGF4ty0rot4
         lHFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6lzW4BlsZetgCzXxUSanRsURtvah1swCuTO5rdJaayc=;
        b=LNCPrtoD6uGLDyJI/b6KqYpEOgX8qgTLrrB9W8dvQBeqeDalprkuM/eqAAxVkz6cJx
         v8vyGFNT8b6N4KkhfPERpN/nhordoZcgmSrf6uTB93loISxeY2QRi+iXR52Bwvmn3igJ
         3B2dQYaPyh7/X2QnnMs4D2x+3Wq44gA/5f8z97eiRsJRLdXw77Mh7X2DySmRVFL24fha
         ylkTFBUdbR8H7tMt52GydtNcFUyDfyX78gsJrDLEMGgVNMvg7yeuuWypewG/l3ihs6mk
         U/bd6XZrusbcCYHhMABfs9VcMVn0gQN6J9czZdTEQIIcKs+46sQEaCYijuYyvMp9AR8Q
         XJ5g==
X-Gm-Message-State: AOAM533KoCQh0Mv4JoelxxLX+/ptBETsPwqyyKPhotdNiL9ogYA3xKRW
	loG++TpRKsHjFmKk8mf4gNfPrFFQV+s=
X-Google-Smtp-Source: ABdhPJxRxpCLy0cFre89eHn7+chccPiKXzBr53GO9fe1kmkoQFwYzKw0cP22uRUjtQBwyKbINUQVAw==
X-Received: by 2002:a17:906:4c56:: with SMTP id d22mr8606019ejw.426.1617271959817;
        Thu, 01 Apr 2021 03:12:39 -0700 (PDT)
Received: from agape.jhs ([5.171.72.75])
        by smtp.gmail.com with ESMTPSA id j14sm3278007edr.97.2021.04.01.03.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 03:12:39 -0700 (PDT)
Date: Thu, 1 Apr 2021 12:12:36 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Joe Perches <joe@perches.com>
Cc: gregkh@linuxfoundation.org, dan.carpenter@oracle.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 49/49] staging: rtl8723bs: remove obsolete macro
Message-ID: <20210401101236.GB32563@agape.jhs>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
 <1c7cdfcf488e5dc5bc5c3c29733b0d53caee71fb.1617268327.git.fabioaiuto83@gmail.com>
 <44730b7154cba578c5c342f1919d0937009985fa.camel@perches.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44730b7154cba578c5c342f1919d0937009985fa.camel@perches.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Thu, Apr 01, 2021 at 02:57:36AM -0700, Joe Perches wrote:
> On Thu, 2021-04-01 at 11:21 +0200, Fabio Aiuto wrote:
> > remove obsolete macro RT_TRACE
> []
> > diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
> []
> > -#ifdef DEBUG_RTL871X
> > -
> > -#if	defined(_dbgdump) && defined(_MODULE_DEFINE_)
> > -
> > -	#undef RT_TRACE
> > -	#define RT_TRACE(_Comp, _Level, Fmt)\
> > -	do {\
> > -		if ((_Comp & GlobalDebugComponents) && (_Level <= GlobalDebugLevel)) {\
> > -			_dbgdump("%s [0x%08x,%d]", DRIVER_PREFIX, (unsigned int)_Comp, _Level);\
> > -			_dbgdump Fmt;\
> > -		} \
> > -	} while (0)
> > -
> > -#endif /* defined(_dbgdump) && defined(_MODULE_DEFINE_) */
> > -#endif /* DEBUG_RTL871X */
> 
> Maybe remove all of these too
> 
> $ git grep DEBUG_RTL871X
> drivers/staging/rtl8723bs/core/rtw_debug.c:#ifdef DEBUG_RTL871X
> drivers/staging/rtl8723bs/core/rtw_debug.c:#endif /* DEBUG_RTL871X */
> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:#ifdef DEBUG_RTL871X
> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:#ifdef DEBUG_RTL871X
> drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:#ifdef DEBUG_RTL871X
> drivers/staging/rtl8723bs/include/autoconf.h:/*#define DEBUG_RTL871X */
> drivers/staging/rtl8723bs/include/rtw_debug.h:#ifdef DEBUG_RTL871X
> drivers/staging/rtl8723bs/include/rtw_debug.h:#endif /* DEBUG_RTL871X */
> 
> 

there are a lot of things to remove, I thought to do it in next patchsets

maybe other obsolete tracing macros are involved...


