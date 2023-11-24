Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259F91CF98
	for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 11:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VvtqmLeB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51844C433C7;
	Fri, 24 Nov 2023 11:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700825452;
	bh=O/6I68Uo5QHlqAFMFXWq24xe3q84sRd1UQDUj2JOVrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VvtqmLeBVJQ1JXW/Sp1GGEYVnX133NDb5q9xn+rpkYUqEDiPSjUvIFdn4sKhXgwsW
	 aM8cWOof6vbnUs0KYtuyiANQUI5XlOIA0uifOcSSsRjfp4Ziss0k46sBI56+13ITQt
	 RM/VPUShhgBvtZa0daVk8GhLGp531Cr/Z0s6/mlA=
Date: Fri, 24 Nov 2023 11:30:51 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Gary Rookard <garyrookard@fastmail.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] staging: rtl8192e: renamed variable
 TXCountToDataRate
Message-ID: <2023112438-sanctuary-imitate-289c@gregkh>
References: <20231123144337.13112-1-garyrookard@fastmail.org>
 <20231123144337.13112-3-garyrookard@fastmail.org>
 <5ff4d268-2fcb-4d55-819a-e2650731b91f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ff4d268-2fcb-4d55-819a-e2650731b91f@gmail.com>

On Thu, Nov 23, 2023 at 09:56:04PM +0100, Philipp Hortmann wrote:
> On 11/23/23 15:43, Gary Rookard wrote:
> > Renamed from Pascal/CamelCase to Snake case the variable
> > TXCountToDataRate.
> > TXCountToDataRate -> tx_count_to_data_rate
> > 
> > Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
> > Driver/module rtl8192e compiles.
> > 
> > Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
> > ---
> > v3: Corrected versioning from v1 -> v3, includes change history.
> > v2: v2 was skipped over..v3 corrects this.
> > v1 Style and compile issues, asked to redo.
> > 
> >   drivers/staging/rtl8192e/rtl819x_HTProc.c    | 2 +-
> >   drivers/staging/rtl8192e/rtllib.h            | 2 +-
> >   drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
> >   3 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > index 280e335cbb6d..fb8294f31a60 100644
> > --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> > @@ -114,7 +114,7 @@ static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 nMcsRate)
> >   	return MCS_DATA_RATE[is40MHz][isShortGI][(nMcsRate & 0x7f)];
> >   }
> > -u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate)
> > +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
> >   {
> >   	u16	CCKOFDMRate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
> >   				   0x24, 0x30, 0x48, 0x60, 0x6c};
> > diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> > index d2cf3cfaaaba..0226a69f40c3 100644
> > --- a/drivers/staging/rtl8192e/rtllib.h
> > +++ b/drivers/staging/rtl8192e/rtllib.h
> > @@ -1783,7 +1783,7 @@ extern u16 MCS_DATA_RATE[2][2][77];
> >   u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
> >   void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
> >   bool IsHTHalfNmodeAPs(struct rtllib_device *ieee);
> > -u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate);
> > +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
> >   int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
> >   int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
> >   int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
> > diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > index f32584291704..28aba1d610f7 100644
> > --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > @@ -208,7 +208,7 @@ int rtllib_wx_get_rate(struct rtllib_device *ieee,
> >   {
> >   	u32 tmp_rate;
> > -	tmp_rate = TxCountToDataRate(ieee,
> > +	tmp_rate = tx_count_to_data_rate(ieee,
> >   				     ieee->softmac_stats.CurrentShowTxate);
> >   	wrqu->bitrate.value = tmp_rate * 500000;
> 
> CHECK: Alignment should match open parenthesis
> #61: FILE: drivers/staging/rtl8192e/rtllib_softmac_wx.c:212:
> +	tmp_rate = tx_count_to_data_rate(ieee,
>  				     ieee->softmac_stats.CurrentShowTxate);

That's fine, it can be cleaned up in a later patch.

thanks,

greg k-h
