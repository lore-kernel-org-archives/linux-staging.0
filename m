Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDE3E48B
	for <linux-staging@lists.linux.dev>; Thu, 23 Nov 2023 23:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.org header.i=@fastmail.org header.b="A6jZUsMu";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VV8YIAF+"
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 0A910320094F;
	Thu, 23 Nov 2023 18:34:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 23 Nov 2023 18:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1700782464; x=1700868864; bh=7S
	oP/9+oMDHq5e1ZFZuMCyNkdAMjmxHmQZZ7tv03aps=; b=A6jZUsMudUpHsYWkPv
	+9Eg94nSym349rYVXA4Rt747HuJLVFxR0UO5zKtKoO0pRflTZP7TbJ8IpVaAAy8S
	N8JFT3CEudpWWxpGN8uqfrRgOZQ9sBQLKJujv+aZV/GE43WmQ4fwknpCZMkrA1/P
	55aUFII/h5d+O0/9I5JBWEjan5mmGpqu1RkMPlbE1Ds+QD7MF5ITEfpfxCyd6lUl
	YAsY7mylk4tKpzg5C+Eq4SrgIzoBPiCRQiV8gBzCW0ebJeYn3Nlcut5PKFP+uHx5
	5dUhaee8+M/KStXexjaE/6jLhyK/uz1r8yzVhXHjeuQvZ14PAUSZA+eJuDBwekFK
	m/lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1700782464; x=1700868864; bh=7SoP/9+oMDHq5
	e1ZFZuMCyNkdAMjmxHmQZZ7tv03aps=; b=VV8YIAF+NBgSqGIzWbz+XiVcmonFC
	uiatPMuhvPE3DMgijhrs7hJC1JX5vOtsahLJUfW78i2nDfGG8Plz5ys7JI8h83oy
	XWK/pz7sMEsks9GfzpZKFucaDH0TezfR7XpFsis3Zx1KBKO9wpU7idhCGxYgkziY
	2O4vteNlLjh/vyEOrS8Rh70dRU5FeR3F221IxqNyK7wCtlJvspnooAotzJyFJXzw
	4pMuYquosP1Jax9jqLapCFzd+Vk9sMh3srNT8lHzwyhSLvtoFYAjxISlFe1tJfyH
	jWG/KqRfYOYLkxkjrzt+3pEuUJWCfkLBO5gi/VDZPKfhHymi2ATJcstjQ==
X-ME-Sender: <xms:gOFfZcBximcby0pIL6Xc636xYmFLB9-oBB7H9AU5NZzsRkM4izyrLQ>
    <xme:gOFfZegKGx0fOJ_rjW_rRYcmJAC7p7rL-u32KtCEazlqnpWPqboIyvvzUiKrgi3T7
    gC85CsKqj8ARG6Ev6s>
X-ME-Received: <xmr:gOFfZflskOXqWiEpp3xOmkvvQ7yJeeoqSUeNlVmGSF4RpMvYKbWA2F5wkc8X6mULPk8OsBKxJLZVPI91OP7yHzOtQpsYkcyr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehgedgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfhgfhffvvefuffgjkfggtgesthdtredttdertdenucfhrhhomhepifgrrhih
    ucftohhokhgrrhguuceoghgrrhihrhhoohhkrghrugesfhgrshhtmhgrihhlrdhorhhgqe
    enucggtffrrghtthgvrhhnpeefleffhfegtefffefgfedugeehhfdvueefffegkeejvdeg
    leeiueelkeeiuddvheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrghrhihrohhokhgrrhgusehfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:gOFfZSyI1SjnhveGMbsVOzMCZhEoYUTt2lsAJDxdrhYLKsABRMn4yg>
    <xmx:gOFfZRRHFiiX5E51KaB2fzUXR3SEKg6q5eXe3n36cE2ygLLanenasw>
    <xmx:gOFfZdbXrnRjc-f-v2Klpy-3yko0fi6BpSNtyZU5mZzgPJRx8Uy5mQ>
    <xmx:gOFfZceis29BXf9rnQtljIIcmNbNf3t5YkMOQS0L9uOUKnzIlTCVIw>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Nov 2023 18:34:23 -0500 (EST)
References: <20231123144337.13112-1-garyrookard@fastmail.org>
 <20231123144337.13112-3-garyrookard@fastmail.org>
 <5ff4d268-2fcb-4d55-819a-e2650731b91f@gmail.com>
User-agent: mu4e 1.10.6; emacs 29.1
From: Gary Rookard <garyrookard@fastmail.org>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] staging: rtl8192e: renamed variable
 TXCountToDataRate
Date: Thu, 23 Nov 2023 18:19:25 -0500
In-reply-to: <5ff4d268-2fcb-4d55-819a-e2650731b91f@gmail.com>
Message-ID: <87v89svybm.fsf@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain


Philipp Hortmann <philipp.g.hortmann@gmail.com> writes:

> On 11/23/23 15:43, Gary Rookard wrote:
>> Renamed from Pascal/CamelCase to Snake case the variable
>> TXCountToDataRate.
>> TXCountToDataRate -> tx_count_to_data_rate
>> Linux kernel coding style (cleanup), checkpatch Avoid CamelCase.
>> Driver/module rtl8192e compiles.
>> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
>> ---
>> v3: Corrected versioning from v1 -> v3, includes change history.
>> v2: v2 was skipped over..v3 corrects this.
>> v1 Style and compile issues, asked to redo.
>>   drivers/staging/rtl8192e/rtl819x_HTProc.c    | 2 +-
>>   drivers/staging/rtl8192e/rtllib.h            | 2 +-
>>   drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
>>   3 files changed, 3 insertions(+), 3 deletions(-)
>> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c
>> b/drivers/staging/rtl8192e/rtl819x_HTProc.c
>> index 280e335cbb6d..fb8294f31a60 100644
>> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
>> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
>> @@ -114,7 +114,7 @@ static u16 ht_mcs_to_data_rate(struct rtllib_device *ieee, u8 nMcsRate)
>>   	return MCS_DATA_RATE[is40MHz][isShortGI][(nMcsRate & 0x7f)];
>>   }
>>   -u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate)
>> +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate)
>>   {
>>   	u16	CCKOFDMRate[12] = {0x02, 0x04, 0x0b, 0x16, 0x0c, 0x12, 0x18,
>>   				   0x24, 0x30, 0x48, 0x60, 0x6c};
>> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
>> index d2cf3cfaaaba..0226a69f40c3 100644
>> --- a/drivers/staging/rtl8192e/rtllib.h
>> +++ b/drivers/staging/rtl8192e/rtllib.h
>> @@ -1783,7 +1783,7 @@ extern u16 MCS_DATA_RATE[2][2][77];
>>   u8 HTCCheck(struct rtllib_device *ieee, u8 *pFrame);
>>   void HTResetIOTSetting(struct rt_hi_throughput *ht_info);
>>   bool IsHTHalfNmodeAPs(struct rtllib_device *ieee);
>> -u16  TxCountToDataRate(struct rtllib_device *ieee, u8 nDataRate);
>> +u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
>>   int rtllib_rx_ADDBAReq(struct rtllib_device *ieee, struct sk_buff *skb);
>>   int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb);
>>   int rtllib_rx_DELBA(struct rtllib_device *ieee, struct sk_buff *skb);
>> diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
>> index f32584291704..28aba1d610f7 100644
>> --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
>> +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
>> @@ -208,7 +208,7 @@ int rtllib_wx_get_rate(struct rtllib_device *ieee,
>>   {
>>   	u32 tmp_rate;
>>   -	tmp_rate = TxCountToDataRate(ieee,
>> +	tmp_rate = tx_count_to_data_rate(ieee,
>>   				     ieee->softmac_stats.CurrentShowTxate);
>>   	wrqu->bitrate.value = tmp_rate * 500000;
>>   
>
> CHECK: Alignment should match open parenthesis
> #61: FILE: drivers/staging/rtl8192e/rtllib_softmac_wx.c:212:
> +	tmp_rate = tx_count_to_data_rate(ieee,
>  				     ieee->softmac_stats.CurrentShowTxate)
Yes, I'm guilty of ignoring the addional CHECKS in my patch
diff. Cleanup only allows one type of correction per patch. They are
going to be included in a follow up patch series that I'm working on.
If this is unacceptable thinking on my part then I will stand corrected.

P.S.
Sorry, but they have been gone over with checkpatch and codespell.

Regards,
Gary


