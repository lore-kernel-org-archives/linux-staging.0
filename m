Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F048C2CAB
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 15:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1635261319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QPSy4Q8SWeSmWCbT1tw01Ne6NKKk7aTJ9QrBbBlrGOk=;
	b=Vso/FqDulbMVmjpgiP3rco/BrSICm7ih8T9s5o0A7wpyt0Ged41g9AiuQwXqeKFgq1XvJF
	xZydZ8/PYVNyDVi6zBhkToVYGS+g6DtmV90jvHDum1EXPCfZHcJNIvWWC9Yv0m4m8eVUO6
	l0DIIMsEHgPT75rpKQs7zIQB6BZ0dDQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-jBS3iRwqOteNnsxmN3zl9A-1; Tue, 26 Oct 2021 11:15:17 -0400
X-MC-Unique: jBS3iRwqOteNnsxmN3zl9A-1
Received: by mail-ed1-f69.google.com with SMTP id x13-20020a05640226cd00b003dd4720703bso7415255edd.8
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 08:15:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QPSy4Q8SWeSmWCbT1tw01Ne6NKKk7aTJ9QrBbBlrGOk=;
        b=6pDUhU13U3Qfb7huLLG2qiYffQd+7N4diO7k3Dhr86tN9s+TGsCXRqXwonpxELs+j2
         fGNZ+o0L7N2xoRPmlNjF2VIGCNYtBiWcxzvFPi+ud8nyhXYNl8d0Pd7EDDUPUomvkZA8
         e2J6sBhWrnTn0m0aC/5XRV2WZSzQdUFdxrb8legpMW2hRXhf9XUqXgmflRgc6mb7tTa+
         gBq+YkGoBQD7WkQ9JuP+SBFZHne3Lu0Am36FvNOiSXGWG3+Wt0ieDT67gT5iZ51rspJJ
         t8nkr5hWMac+hVAH5GNs9vLgNnt2v3ercORZ/pnRLeUCRLtANSrjPWvbxu+LPVGgCO0+
         WZsQ==
X-Gm-Message-State: AOAM5300XgrVuD5aBGT0lIIyXY10UUq+1x3DtIZ33FCJ8IPQSqVBR3O6
	x2hRoJlgF+1NTDBsNGtXa00Gk49FRYLPs6VbQiUTl02NsRbtAzhMGCO296II+ZH1yxYv7oUyT1u
	Q8dqVEFXvOtr7JX4kD8IKdeFshw==
X-Received: by 2002:a50:ec06:: with SMTP id g6mr27147896edr.144.1635261315039;
        Tue, 26 Oct 2021 08:15:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLnTCMW1fg+5kTF7B11mVpoXzJrYGwUFdz/5P/EbbrO/QW3dZ+rAFbhk7FNvjJHWhZxL5ohA==
X-Received: by 2002:a50:ec06:: with SMTP id g6mr27147868edr.144.1635261314855;
        Tue, 26 Oct 2021 08:15:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id yd8sm4743361ejb.33.2021.10.26.08.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Oct 2021 08:15:14 -0700 (PDT)
Message-ID: <eb7db8fa-0557-425f-b08d-1d55ac07610a@redhat.com>
Date: Tue, 26 Oct 2021 17:15:13 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] staging: rtl8723bs: core: Refactor nested if-else
To: kushal kothari <kushalkothari285@gmail.com>,
 Mike Rapoport <mike.rapoport@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, fabioaiuto83@gmail.com,
 ross.schm.dev@gmail.com, marcocesati@gmail.com,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, kushalkothari2850@gmail.com
References: <20211026134253.7868-1-kushalkothari285@gmail.com>
 <YXgOdpebeA/dFWIz@kernel.org>
 <CALtHPQuKDa23Ui4wBVed=7FOkf6u+-MjL1VU-4CD6hXSjmsq6g@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CALtHPQuKDa23Ui4wBVed=7FOkf6u+-MjL1VU-4CD6hXSjmsq6g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 10/26/21 17:12, kushal kothari wrote:
> Yes!
> Also initializing  variable pstat->has_legacy_ac = false;  //false
> which is previously set to true before the loop so it can be removed too.

Note please do not make too many changes in a single patch.

It is best to do refactoring like this in small steps making
only 1 change at a time, that makes things a lot easier to
review / to verify that there are no functional changes.

Regards,

Hans


> 
> On Tue, Oct 26, 2021 at 7:49 PM Mike Rapoport <mike.rapoport@gmail.com <mailto:mike.rapoport@gmail.com>> wrote:
> 
>     On Tue, Oct 26, 2021 at 07:12:53PM +0530, Kushal Kothari wrote:
>     > Refactor nested if-else to avoid deep indentations. There is no change
>     > in the logic of the new code, however, now it is simple because it gets
>     > rid of five unnecessary else conditionals and it combines nested if into
>     > single if-else-if. This refactor also leads to fix warning detected by
>     > checkpatch.pl <http://checkpatch.pl>:
>     > WARNING: Too many leading tabs - consider code refactoring
>     >
>     > Signed-off-by: Kushal Kothari <kushalkothari285@gmail.com <mailto:kushalkothari285@gmail.com>>
>     > ---
>     >
>     > Changes in v2: Fix the bug of not handling properly the else logic
>     > when p is not null in else-if. Also, reword the subject line and break
>     > it up at 72 columns.
>     >
>     >  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 69 ++++++++-----------
>     >  1 file changed, 29 insertions(+), 40 deletions(-)
>     >
>     > diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>     > index 0f82f5031c43..267d853b1514 100644
>     > --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>     > +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
>     > @@ -1192,50 +1192,39 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>     >               p = pframe + WLAN_HDR_A3_LEN + ie_offset; ie_len = 0;
>     >               for (;;) {
>     >                       p = rtw_get_ie(p, WLAN_EID_VENDOR_SPECIFIC, &ie_len, pkt_len - WLAN_HDR_A3_LEN - ie_offset);
>     > -                     if (p) {
>     > -                             if (!memcmp(p+2, WMM_IE, 6)) {
>     > -
>     > -                                     pstat->flags |= WLAN_STA_WME;
>     > -
>     > -                                     pstat->qos_option = 1;
>     > -                                     pstat->qos_info = *(p+8);
>     > -
>     > -                                     pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
>     > -
>     > -                                     if ((pstat->qos_info&0xf) != 0xf)
>     > -                                             pstat->has_legacy_ac = true;
>     > -                                     else
>     > -                                             pstat->has_legacy_ac = false;
>     > -
>     > -                                     if (pstat->qos_info&0xf) {
>     > -                                             if (pstat->qos_info&BIT(0))
>     > -                                                     pstat->uapsd_vo = BIT(0)|BIT(1);
>     > -                                             else
>     > -                                                     pstat->uapsd_vo = 0;
>     > -
>     > -                                             if (pstat->qos_info&BIT(1))
>     > -                                                     pstat->uapsd_vi = BIT(0)|BIT(1);
>     > -                                             else
>     > -                                                     pstat->uapsd_vi = 0;
>     > -
>     > -                                             if (pstat->qos_info&BIT(2))
>     > -                                                     pstat->uapsd_bk = BIT(0)|BIT(1);
>     > -                                             else
>     > -                                                     pstat->uapsd_bk = 0;
>     > -
>     > -                                             if (pstat->qos_info&BIT(3))
>     > -                                                     pstat->uapsd_be = BIT(0)|BIT(1);
>     > -                                             else
>     > -                                                     pstat->uapsd_be = 0;
>     > -
>     > -                                     }
>     > -
>     > -                                     break;
>     > +                     if (p && memcmp(p+2, WMM_IE, 6)) {
>     > +                             p = p + ie_len + 2;
>     > +                     } else if (p && !memcmp(p+2, WMM_IE, 6)) {
>     > +                             pstat->flags |= WLAN_STA_WME;
>     > +                             pstat->qos_option = 1;
>     > +                             pstat->qos_info = *(p+8);
>     > +                             pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
>     > +
>     > +                             pstat->has_legacy_ac = false;
>     > +                             if ((pstat->qos_info&0xf) != 0xf)
>     > +                                     pstat->has_legacy_ac = true;
>     > +
>     > +                             if (pstat->qos_info&0xf) {
>     > +                                     pstat->uapsd_vo = 0;
> 
>     This variable and other variables below are set to 0 just before the loop,
>     so the initialization here can be removed.
> 
>     > +                                     if (pstat->qos_info&BIT(0))
>     > +                                             pstat->uapsd_vo = BIT(0)|BIT(1);
>     > +
>     > +                                     pstat->uapsd_vi = 0;
>     > +                                     if (pstat->qos_info&BIT(1))
>     > +                                             pstat->uapsd_vi = BIT(0)|BIT(1);
>     > +
>     > +                                     pstat->uapsd_bk = 0;
>     > +                                     if (pstat->qos_info&BIT(2))
>     > +                                             pstat->uapsd_bk = BIT(0)|BIT(1);
>     > +
>     > +                                     pstat->uapsd_be = 0;
>     > +                                     if (pstat->qos_info&BIT(3))
>     > +                                             pstat->uapsd_be = BIT(0)|BIT(1);
>     >                               }
>     > +                             break;
>     >                       } else {
>     >                               break;
>     >                       }
>     > -                     p = p + ie_len + 2;
>     >               }
>     >       }
>     > 
>     > --
>     > 2.25.1
>     >
> 
>     -- 
>     Sincerely yours,
>     Mike.
> 

