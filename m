Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01926FD2
	for <linux-staging@lists.linux.dev>; Tue, 26 Sep 2023 12:39:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 866215C2714;
	Tue, 26 Sep 2023 08:39:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 26 Sep 2023 08:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1695731983; x=1695818383; bh=1L
	tHdVfKG97FAOoSrdn4e1k546KKFsD95Ly4Y2jawY4=; b=dEoERRzgKy8J3KTHES
	BU0BTWHGaAjP8onGeVhonbCicbN10curcebv3wWIIEyrOWLsrF/p3m1Q8oKyPZmm
	IXj3beIm9qxuvjBjJIiEIdmqOxa0JIAVZybV2qsrNyJjL0l9FQye1G4qztBoTDsu
	5sk/Et3HLU8qV+KC9DuaURl7AR84gju3G4/kkhwS3L2ts6aa2q8FHyPJgvA1DqCS
	IMjHvlgf491uPXPNV0mWmcxvT/EZF0ADH9WhpJEqUKzz9yllY2LjMgV1sksYILsh
	C+ea44+fmdNOkErehvsdIGsxSSPAYFWTBQjfXbkg98ckkaJ05VBwz3TA4XttsjZ+
	2tOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1695731983; x=1695818383; bh=1LtHdVfKG97FA
	OoSrdn4e1k546KKFsD95Ly4Y2jawY4=; b=npOt+dVGNl7S1G8xudjX71xH8KH1Y
	KVc4BBjq1cLNCwDI3tvBkO9jdgSlIbkvXyuaSX+RXR7LX+a2dEYRFluXu3nuY7a3
	LHjwO424KrlDLzMhUihF2MFdODFk8cUBVGIF99THqd8xaS11JvTFWAvPZn9FCcKH
	ZgJPGHjfrt3zRuS/vZmNNQ5kQVWn/giGmgmHwdVWh5Mmhw7F2gtSvOrZApCqzFV8
	+q4YUnUVRZ105btPB2pOEeTdAp3KbiqGNwWBFrWyj1bWNVGPScEaLdyDNBv0Z2zY
	ryX2uI/sQDYSc942kqmsjfr/bTFZ2938xKaN1vM65KzARnVTjBaSYrBjA==
X-ME-Sender: <xms:D9ESZeRg41GL46zALyLOrWLgToa8W9IR_qtxPBw0Rjxjrhx5hy04-g>
    <xme:D9ESZTw1A3kMmtPrQuESCZwi96spdwuB7OfRwbC0MW6aYJCYlNI7kriosI1ERd32N
    fFYwoInJ3Tbt6n7meM>
X-ME-Received: <xmr:D9ESZb3q4XpHgs-ESsxmoRgfCLbL-mnw3SIqqaEVkqG1vGZQaboA6_PV9RU2MrTFbU9Wqcp0H8nQ9Btjv1KOd1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtddtgddviecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpehffgfhvfevufffjgfkgggtsehttdertddtredtnecuhfhrohhmpehgrghrhihr
    ohhokhgrrhgusehfrghsthhmrghilhdrohhrghenucggtffrrghtthgvrhhnpeeiuddvle
    ektdfhgeetvedvjeegkeeuvddttdejleefvdeuvefhlefgveevieeukeenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrghrhihrohhokhgrrh
    gusehfrghsthhmrghilhdrohhrgh
X-ME-Proxy: <xmx:D9ESZaAsNtzJqgckwGrYXwW_4m2IgV_1rWUqruvv2uLGDFkXRDglzA>
    <xmx:D9ESZXiE7I7PQZQFCn107Z-PknQwE21xaVzQNkXhKlSsnN0mdqAfzw>
    <xmx:D9ESZWrTPgkHezXP_VhcWjy32sJhtcMjtSDo81cwpz6nRi4WhL52nA>
    <xmx:D9ESZfYrKvenS12KgWU0Kdc3yVPE5EJb5HnZVvGCKiGjIgPpYHQEwQ>
Feedback-ID: ifd194980:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Sep 2023 08:39:42 -0400 (EDT)
References: <20230925151157.3893-1-garyrookard@fastmail.org>
 <20230925151157.3893-2-garyrookard@fastmail.org>
 <2023092617-skydiver-unsworn-18f8@gregkh>
User-agent: mu4e 1.10.6; emacs 28.2
From: garyrookard@fastmail.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rtl8192e: renamed (1) mixed case variable
Date: Tue, 26 Sep 2023 08:38:28 -0400
In-reply-to: <2023092617-skydiver-unsworn-18f8@gregkh>
Message-ID: <87wmwdw1ls.fsf@fastmail.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Okay, will do.
Greg KH <gregkh@linuxfoundation.org> writes:

> On Mon, Sep 25, 2023 at 11:11:55AM -0400, Gary Rookard wrote:
>> Renamed (1) prototype variable that was written in mixed case.
>> HTUpdateDefaultSetting -> ht_update_default_setting
>> 
>> Linux kernel coding style "cleanup".
>> No change in runtime logic.
>> 
>> Signed-off-by: Gary Rookard <garyrookard@fastmail.org>
>> ---
>>  drivers/staging/rtl8192e/rtllib.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
>> index 5517b9df65be..1a3dd4dcad81 100644
>> --- a/drivers/staging/rtl8192e/rtllib.h
>> +++ b/drivers/staging/rtl8192e/rtllib.h
>> @@ -1807,7 +1807,7 @@ int rtllib_wx_get_rts(struct rtllib_device *ieee, struct iw_request_info *info,
>>  void HTSetConnectBwMode(struct rtllib_device *ieee,
>>  			enum ht_channel_width bandwidth,
>>  			enum ht_extchnl_offset Offset);
>> -void HTUpdateDefaultSetting(struct rtllib_device *ieee);
>> +void ht_update_default_setting(struct rtllib_device *ieee);
>>  void HTConstructCapabilityElement(struct rtllib_device *ieee,
>>  				  u8 *posHTCap, u8 *len,
>>  				  u8 isEncrypt, bool bAssoc);
>> -- 
>> 2.41.0
>> 
>> 
>
> You just broke the build?
>
> Also, you sent 3 patches that do different things, yet have identical
> subject lines, that's obviously not correct.
>
> Please fix up and resend a v2 series.
>
> thanks,
>
> greg k-h

