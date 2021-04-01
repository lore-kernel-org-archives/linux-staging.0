Received: from smtprelay.hostedemail.com (smtprelay0176.hostedemail.com [216.40.44.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA96870
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 12:25:59 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id C74F51812F674
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 09:57:46 +0000 (UTC)
Received: from omf09.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id D6D721821939A;
	Thu,  1 Apr 2021 09:57:39 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf09.hostedemail.com (Postfix) with ESMTPA id E24EE1E04DB;
	Thu,  1 Apr 2021 09:57:38 +0000 (UTC)
Message-ID: <44730b7154cba578c5c342f1919d0937009985fa.camel@perches.com>
Subject: Re: [PATCH 49/49] staging: rtl8723bs: remove obsolete macro
From: Joe Perches <joe@perches.com>
To: Fabio Aiuto <fabioaiuto83@gmail.com>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Date: Thu, 01 Apr 2021 02:57:36 -0700
In-Reply-To: <1c7cdfcf488e5dc5bc5c3c29733b0d53caee71fb.1617268327.git.fabioaiuto83@gmail.com>
References: <cover.1617268327.git.fabioaiuto83@gmail.com>
	 <1c7cdfcf488e5dc5bc5c3c29733b0d53caee71fb.1617268327.git.fabioaiuto83@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E24EE1E04DB
X-Spam-Status: No, score=0.10
X-Stat-Signature: i16kjuuxdf6pyfcafokbc7k1wb5bhuyk
X-Rspamd-Server: rspamout01
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/1pH22N4+o4Qcx1qZTrXkESthNYQEGMPA=
X-HE-Tag: 1617271058-622136

On Thu, 2021-04-01 at 11:21 +0200, Fabio Aiuto wrote:
> remove obsolete macro RT_TRACE
[]
> diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
[]
> -#ifdef DEBUG_RTL871X
> -
> -#if	defined(_dbgdump) && defined(_MODULE_DEFINE_)
> -
> -	#undef RT_TRACE
> -	#define RT_TRACE(_Comp, _Level, Fmt)\
> -	do {\
> -		if ((_Comp & GlobalDebugComponents) && (_Level <= GlobalDebugLevel)) {\
> -			_dbgdump("%s [0x%08x,%d]", DRIVER_PREFIX, (unsigned int)_Comp, _Level);\
> -			_dbgdump Fmt;\
> -		} \
> -	} while (0)
> -
> -#endif /* defined(_dbgdump) && defined(_MODULE_DEFINE_) */
> -#endif /* DEBUG_RTL871X */

Maybe remove all of these too

$ git grep DEBUG_RTL871X
drivers/staging/rtl8723bs/core/rtw_debug.c:#ifdef DEBUG_RTL871X
drivers/staging/rtl8723bs/core/rtw_debug.c:#endif /* DEBUG_RTL871X */
drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:#ifdef DEBUG_RTL871X
drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:#ifdef DEBUG_RTL871X
drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:#ifdef DEBUG_RTL871X
drivers/staging/rtl8723bs/include/autoconf.h:/*#define DEBUG_RTL871X */
drivers/staging/rtl8723bs/include/rtw_debug.h:#ifdef DEBUG_RTL871X
drivers/staging/rtl8723bs/include/rtw_debug.h:#endif /* DEBUG_RTL871X */


