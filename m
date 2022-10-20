Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349D38F5A;
	Fri, 21 Oct 2022 08:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666340200; bh=rq4nFfLFBNopLTvnBacKDQMrbUk0qjBxcZ/WYwikKWs=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:In-Reply-To;
	b=lnhZ1oX1XZsW2/fr4YOpn0YH3zbwDglHviCD1+0oVQfQ4U2mgelnv8PDm22QZvJv7
	 JsPYvbtYhbMAZYCAoFLQLTyNNfdy1hdtQKHqtyb0b5SnuTw6Q1V0sWHaiSZ9dHkTac
	 nZoqZeXBDKwf+FD8i6HbVLcI89bnTIlUFqZVP7KA=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Fri, 21 Oct 2022 10:16:40 +0200 (CEST)
X-EA-Auth: /MX489PWaKIL40qCBp7ipOrW9XeFpM3b7YgwlMUsJWoXPBTriN/O4JnmygTNfxIBLxq7AgxoO83WsC/hLsXJ8OJhahVVRCPc
Date: Fri, 21 Oct 2022 05:01:14 +0530
From: Deepak R Varma <drv@mailo.com>
To: Praveen Kumar <kumarpraveen@linux.microsoft.com>
Cc: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, saurabh.truth@gmail.com
Subject: Re: [PATCH v4 08/11] staging: r8188eu: replace leading spaces by tabs
Message-ID: <Y1HaQmlhNGU0XSV1@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1666299151.git.drv@mailo.com>
 <c32b702c61ea3367d60f0a4c2443093d6ce45a69.1666299151.git.drv@mailo.com>
 <a1429a6a-1688-c30a-4fb2-3d575ffecbf1@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1429a6a-1688-c30a-4fb2-3d575ffecbf1@linux.microsoft.com>

On Fri, Oct 21, 2022 at 11:04:49AM +0530, Praveen Kumar wrote:
> On 21-10-2022 03:01, Deepak R Varma wrote:
> > Spaces are prohibited as per the Linux coding style guidelines. Replace
> > those by tabs wherever possible to improve code alignment. Error
> > reported by checkpatch script.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >
> > Changes in v4:
> >    -- None.
> >
> > Changes in v3:
> >    1. Patch newly added in the patch set.
> >
> >  drivers/staging/r8188eu/include/rtw_cmd.h      | 10 +++++-----
> >  drivers/staging/r8188eu/include/rtw_mlme.h     |  2 +-
> >  drivers/staging/r8188eu/include/rtw_mlme_ext.h |  2 +-
> >  3 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
> > index 61fb523afb08..4b6a91aefc1e 100644
> > --- a/drivers/staging/r8188eu/include/rtw_cmd.h
> > +++ b/drivers/staging/r8188eu/include/rtw_cmd.h
> > @@ -592,14 +592,14 @@ struct setratable_parm {
> >  };
> >
> >  struct getratable_parm {
> > -                uint rsvd;
> > +	uint rsvd;
> >  };
> >
> >  struct getratable_rsp {
> > -        u8 ss_ForceUp[NumRates];
> > -        u8 ss_ULevel[NumRates];
> > -        u8 ss_DLevel[NumRates];
> > -        u8 count_judge[NumRates];
> > +	u8 ss_ForceUp[NumRates];
> > +	u8 ss_ULevel[NumRates];
> > +	u8 ss_DLevel[NumRates];
>
> Can this be reworked further like ss_ForceUp -> ss_force_up or ss_forceup ?
> Similarly for other attributes.

Absolutely; however, it will have to be in a separate patch since that change
will be "Avoid CamelCase", different from the current scope of this patch.
I am making note of this work as a separate patch. I will send that in as a
standalone patch as I would like to keep the current patch set size manageable
by me.

Thank you Praveen.
./drv

>
> > +	u8 count_judge[NumRates];
> >  };
> >
> >  /* to get TX,RX retry count */
> > diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
> > index 7658f864136e..ebf7168a7ef9 100644
> > --- a/drivers/staging/r8188eu/include/rtw_mlme.h
> > +++ b/drivers/staging/r8188eu/include/rtw_mlme.h
> > @@ -528,7 +528,7 @@ void rtw_indicate_scan_done(struct adapter *padapter);
> >  int rtw_restruct_sec_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
> >  			uint in_len);
> >  int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie,
> > -		        uint in_len, uint initial_out_len);
> > +			uint in_len, uint initial_out_len);
> >  void rtw_init_registrypriv_dev_network(struct adapter *adapter);
> >
> >  void rtw_update_registrypriv_dev_network(struct adapter *adapter);
> > diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> > index be470f913a94..413b94e38744 100644
> > --- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> > +++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
> > @@ -449,7 +449,7 @@ void ERP_IE_handler(struct adapter *padapter, struct ndis_802_11_var_ie *pIE);
> >  void VCS_update(struct adapter *padapter, struct sta_info *psta);
> >
> >  void update_beacon_info(struct adapter *padapter, u8 *pframe, uint len,
> > -		        struct sta_info *psta);
> > +			struct sta_info *psta);
> >  int rtw_check_bcn_info(struct adapter  *Adapter, u8 *pframe, u32 packet_len);
> >  void update_IOT_info(struct adapter *padapter);
> >  void update_capinfo(struct adapter *adapter, u16 updatecap);
> > --
> > 2.30.2
> >
> >
> >
>
> Regards,
>
> ~Praveen.
>


