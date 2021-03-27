Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131085F
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 14:44:41 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id t6so7493128ilp.11
        for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BXtzfODoTNZz35d2SUT5fneEA+e5CsUTfnR6fOoZbTQ=;
        b=dP0XHt8kftvgIuKnyjyto4iaY2A73qxMmyjLXoCp2FEgahARSrbNcVYdj0yJzPqLQn
         xjlmmYRyXllTO5iumiOOreUxaqycOuRIrmQmdW4PF8Rkpae6kmayo8xHdq96pSI2FzXE
         nzNguQdG912tQ6k0KTnpm9Eu2RFSKlB0JXKXLpIRAgChyPQBP8aLyn5w8azEbp5g6sYP
         d6xwDWdRVedMx80ImxIQ0ekdbJ/Dj3clivDT7sb2w8S8ro8Qi+28KnSYxPRBM3t7ujiT
         ss0XLoopGDLxLlmC9D2If8MFV5LtihuSaXvKeJ94n4lTi5C8WJ/nwAGVTrw9jaT4tGGK
         NQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BXtzfODoTNZz35d2SUT5fneEA+e5CsUTfnR6fOoZbTQ=;
        b=rXhp73XeOxRsyRPTZnYO73VPLwuTb++stdOfAgP8lAphAYXPm9LzrN/MoyE9eff/hd
         DafGWeN6GttMEtzzfxMRKvy6BjPivp7C4UZ+lqRaVFmIXz0CODsZ54A9v+XhqHN8YRbM
         sWuWd52nZ5/jPnDv/ShVAsxVr4jAuexgifcqkW096TnmCy1n9vy5DEgum1YmMwjoLvJb
         DWdR4aO4v9SBCILuBbSzwxHzKpCszqZswV0drCkppQlv5IPqXwRJ/i05JOkAwPryzpFm
         qxwDbjGIepdqPHH0982gdHwMjXh0W3TmVKqUqScR8g6tbPTNIO0/1A1AW3TsHWPUwds7
         sfBg==
X-Gm-Message-State: AOAM532vchDOs+6VSQ8RNiHEUo0eHJxh/zaVMZJM8ohKhcN8noeQSfUU
	YRNemKkEy6khJuffyQICxAMVQTGhdP+DBxmyxHQ=
X-Google-Smtp-Source: ABdhPJyeoXNRGaZpD87mDIphQzar9i9dcf55V704fpQ38WqRChCjHfd5FQ5LksqW3js5uvdFp1AWHbEJCm9E+rBNuOU=
X-Received: by 2002:a05:6e02:b2b:: with SMTP id e11mr5673970ilu.149.1616856281261;
 Sat, 27 Mar 2021 07:44:41 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210327001736.180881-1-eantoranz@gmail.com> <20210327001736.180881-5-eantoranz@gmail.com>
 <20210327081758.GJ1667@kadam>
In-Reply-To: <20210327081758.GJ1667@kadam>
From: Edmundo Carmona Antoranz <eantoranz@gmail.com>
Date: Sat, 27 Mar 2021 08:44:29 -0600
Message-ID: <CAOc6etZaqnDXU4dgBmx_qd8iwpmEjDhs=7JnLuCUFxs65=TRHQ@mail.gmail.com>
Subject: Re: [PATCH -next 5/6] staging: rtl8723bs: mark some variables as __maybe_unused
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marco Cesati <marcocesati@gmail.com>, 
	Ross Schmidt <ross.schm.dev@gmail.com>, fabioaiuto83@gmail.com, 
	linux-staging@lists.linux.dev, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 27, 2021 at 2:18 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This is just papering over badness.  Leave the warnings as is so someone
> will notice it and fix it properly in the future.
>

Interesting.... I wonder what the right way to handle this would be
then. Is it a more appropriate solution defining the debug macros
_only_ if we are debugging and then also use #ifs in code to define
the variables and handle them?

So, currently, in rtw_debug.h, we have this (lines ~134-140):

#define RT_TRACE(_Comp, _Level, Fmt) do {} while (0)
#define RT_PRINT_DATA(_Comp, _Level, _TitleString, _HexData,
_HexDataLen) do {} while (0)

#define DBG_871X(x, ...) do {} while (0)
#define MSG_8192C(x, ...) do {} while (0)
#define DBG_8192C(x, ...) do {} while (0)
#define DBG_871X_LEVEL(x, ...) do {} while (0)


And then, a bit further down the road in the same file:
#ifdef DEBUG
#if defined(_dbgdump)
    #undef DBG_871X
    #define DBG_871X(...)     do {\
        _dbgdump(DRIVER_PREFIX __VA_ARGS__);\
    } while (0)

    #undef MSG_8192C
    #define MSG_8192C(...)     do {\
        _dbgdump(DRIVER_PREFIX __VA_ARGS__);\
    } while (0)

    #undef DBG_8192C
    #define DBG_8192C(...)     do {\
        _dbgdump(DRIVER_PREFIX __VA_ARGS__);\
    } while (0)
#endif /* defined(_dbgdump) */
#endif /* DEBUG */

If we remove the definition of the macros that were around line 134,
we need to make sure that those macros are not used in code if the
same conditions are not met... so, it might mean that we control if we
define the variables we are using... one of the examples from this
patch:


    unsigned char *p, *pos, *wpa_ie;
#ifdef DEBUG && defined(_dbgdump)
    unsigned char * reassoc;
#endif
    unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
.
.
.
    if (frame_type == WIFI_ASSOCREQ) {
#ifdef DEBUG && defined(_dbgdump)
        reassoc = 0;
#endif
        ie_offset = _ASOCREQ_IE_OFFSET_;
    } else { /*  WIFI_REASSOCREQ */
#ifdef DEBUG && defined(_dbgdump)
        reassoc = 1;
#endif
        ie_offset = _REASOCREQ_IE_OFFSET_;
    }

    if (pkt_len < sizeof(struct ieee80211_hdr_3addr) + ie_offset) {
#ifdef DEBUG && defined(_dbgdump)
        DBG_871X("handle_assoc(reassoc =%d) - too short payload (len =%lu)"
             "\n", reassoc, (unsigned long)pkt_len);
#endif
        return _FAIL;
    }

> regards,
> dan carpenter
>
