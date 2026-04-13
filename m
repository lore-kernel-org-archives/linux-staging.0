Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F3C1C68F
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 23:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776124662; cv=pass; b=hK1jeEt5P9hsnOD8MyAI3QF9Y/8KQQsG1QU+bW9l7QlOuE3PMuFVxM63rZm2PBv6Fd8LJ+hnH7lzbip9Ur9yB56c4XL6Ng9MDPo4YfTe7SiRRhL3QmHVXpP+PTZotBqczX6s9q1nJDlyhKF+ciR+Tj/EBGEFYbfVxQ4WxUORIs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776124662; c=relaxed/simple;
	bh=DHeuklQoBLe7ZR7zvgCKBthzDWzW2nnzX5WbxeMXe0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atKAGz0oVr4aaFayUKaJ5X3HbKZOiULio0x72IfFf9/0ZZ5ftQElW7wQT227b0T0NQway4eCFIdC+uoMtwuP6gBW8MzupVCr5LaEOtrnahZsHUNNKiOwLL86GB9PkKTj042LjJuFA+CxSemkN5AVODX9xRNJNYghcj1SAmj3eL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUL29ki/; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUL29ki/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d73422431so1424815f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 16:57:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776124660; cv=none;
        d=google.com; s=arc-20240605;
        b=NcQPVW2NOTfwmhcN/2VTvRdBkyEM4G8rhtw9hDWmtHCPUF/MdfFDw2qVk+vjwGd0Ti
         HurnB9+h5bBv83PqppYYPD/mEiJfEhO2AUQyP7kBSxLPg0+mYKdIvh5LsCz2X9uuc5b/
         A7P7aGjC35iEKTdhFJcZ9mzonYl8zyHihegknWCnb3W2AOljTfmBeIgbUzUN3sGWBVLh
         82Ftpad+Nn2Ea37wstOMsFQWRN/BWRDEnItjJzgfgMvxojrj3WRpJXoPFv1d+AcAbgHY
         z87BjsFCmkQL/gK3Iq05b5tlkGZyhMoNOrZ4KyhZS2OLGaiKA8Mc2Bp7pPJkiu9CFGCZ
         Rg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AWoeu0QsztjxOljYcaLOTOXa4MTwUzaai1h+8KSWQno=;
        fh=faM5DSj3wrNx0N644xKy4RlioxWM8LigNJewykkyswM=;
        b=NgnclwNNjnQ6m31XU4+S0Enk2RG0hyQPcJbHjVblYd+PTGuGl1LSco/tl/PT3ECY5Z
         ReNHSSYsuUzqtlJT2nC/znQy8enb0gLNnkaTjWyXEph62Iu5tUcGfdZEwqe1fMqI4+XW
         A7GtnPbpcy3ouxVfNDWYakqNm36/Dj02hYP8/eukg/SaProjL82p7lX2PbMWIkLNocAz
         Z/cruBnvXNdy30k6A3gfpZfAtDjysJ35gX7pK9Ge/9Sru5OaBnB18h0mmOtOAJME3CWb
         fRGESDv4uzlMf+/GBEB8osxVZ+L6sLkWDNhCwH5LXSLjm5VF4fCYW49tz+VG9c5Gkm2A
         EzZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776124660; x=1776729460; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AWoeu0QsztjxOljYcaLOTOXa4MTwUzaai1h+8KSWQno=;
        b=eUL29ki/GqyxZBz/TXZb4Scn8G80RDTnvQBZTq75E3RElHEBLWIc9MT+Fdqv50C742
         TtDTpUClfkaK9bcSO4TJS6ICZBjovSJJectMQ/N2YQ69jIpBLeGb9FGxizw/2gry9SE+
         b8sFfsFB5YBTz33hFLx5u/AOD99igDMsP9uDhnuAt78LRB8WVIDINpy9J+HVDJrjdxBT
         BvG0L8p6Fdgny1kzHml3G2DjWQGMxhvm3OIw03ecWuHVnyMiiKKIMeQ2Yg41isM78qfJ
         G68G/UyQ0OfUV5Pjny6q+6PBreWbpvkA68VO0l+YAm/0UfVxq6B0onl6gcDALQV2yxNV
         cJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776124660; x=1776729460;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWoeu0QsztjxOljYcaLOTOXa4MTwUzaai1h+8KSWQno=;
        b=Zu4Mu2SfA7PxzJoFLsALyLryuDcgR2a7ddnFQe+RtH9zo+Osq9IH11CUW++RmodHR9
         7Ev/ItQ9HI42ueUJ9gJR31RkCD0hbLNSKBeBPy6CBB0Wm0bg5mKuA5KXmwrFmdSzXSEv
         DkiygipnFjtSZTn+OW3BHNwuzI8fhzM+/2NUrXiFJ/jEv8g88hdoH+pxDcFL7BQiBRmr
         nwe9+e5eDbGLPN7+yJpqQ6WILRHRknIFZiTj62qZuEsAQF0n+YuH8IUF+ViJFa/2QSlZ
         P052kyXdbRLmWRELsA2jsq4mYXWN6UAKPnYTNOF9CqL9Pq0k7D63h0KnD7qRuNNbcBk8
         Kf0A==
X-Forwarded-Encrypted: i=1; AFNElJ/IXZosiy/8UaL1qBLJOyLfBpdVjE8eY81Db3d5IiJTEGaBL4msPSXMrktToCwdyf3gRYM5bx6bHPfsdlIL@lists.linux.dev
X-Gm-Message-State: AOJu0YyVR0T3TUxKwxuS6xNssfYJx5sAjWJDt2VX0U5u/g1/J5ImIH2i
	rou3Ir3CRxCyMwuC1b2EOqebC00VEhkR7OzVYYgn/dZXEKh5IKXCCm5zqR1yUqTvgnr7fYkjIMY
	dRaOvlOPwAGE//+7mlNCmmrKMA8/eobA=
X-Gm-Gg: AeBDiestvEXdtsWKDo+SuZPal5PUTdEEneTW1m3EbNBvf6LiWsr7k1TJemzu0WTQVbe
	th5Eeh2Org5eLTjzomVk5T+g69YjeCDlBRxXqzpjVednuv4KzShNqKNFZwxSG9HuLSOpc+HakkH
	4x/Hlb+bzrtnsaef2DeKKW0WKo5W1ejyUSRiP+I7/fkqDcLo4T57KCo1M+6XVgYLim46BV83jQQ
	NeAvunb8XbcyBj2gsCluhXFty8DBBHZnusXHPwu9XI80oZ0khLp0FAicxsWTa3mo+7JLcl26Kyh
	B5KH+V/yeQ==
X-Received: by 2002:a05:6000:208a:b0:43c:f95c:3e70 with SMTP id
 ffacd0b85a97d-43d642dac9fmr21397240f8f.25.1776124659766; Mon, 13 Apr 2026
 16:57:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DHSBOBFQ3HZK.39HN9XAYE4BT1@gmail.com> <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <CALx+fbZ_K3C2sTWY_HigceJcp414OEhyEQLGTDEfNnU2q_zKiA@mail.gmail.com>
In-Reply-To: <CALx+fbZ_K3C2sTWY_HigceJcp414OEhyEQLGTDEfNnU2q_zKiA@mail.gmail.com>
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Date: Tue, 14 Apr 2026 05:27:28 +0530
X-Gm-Features: AQROBzCoWskeGDVTW0nuLcHdgly15pS-K0M593ydt93JuihmxVpdZzXdz9cqr78
Message-ID: <CALx+fbbke16+D1Y6+W1SQPArW7Xh+F+aPKZbiKykaEPy6X9ipw@mail.gmail.com>
Subject: Re: [PATCH v2] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
To: Greg KH <gregkh@linuxfoundation.org>, ethantidmore06@gmail.com
Cc: Nayana Mariyappa <nayana.mariyappa@gmail.com>, s9430939@naver.com, 
	andriy.shevchenko@intel.com, kees@kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Apologies, the previous mail may not have reached the mailing list
correctly due to a mail client issue. Resending for visibility.

Thanks & Regards,
Shyam Sunder Reddy


On Tue, 14 Apr 2026 at 05:02, Shyam Sunder Reddy Padira
<shyamsunderreddypadira@gmail.com> wrote:
>
> Apologies, the previous mail had an incorrect To address.
>
> Resending correct recipients in the thread for visibility.
>
> Thanks,
> Shyam Sunder Reddy Padira
>
> On Tue, 14 Apr, 2026, 04:17 Shyam Sunder Reddy Padira, <shyamsunderreddypadira@gmail.com> wrote:
>>
>> The return value of kzalloc_flex() is used without
>> ensuring that the allocation succeeded, and the
>> pointer is dereferenced unconditionally.
>>
>> Guard the access to the allocated structure to
>> avoid a potential NULL pointer dereference if the
>> allocation fails.
>>
>> Fixes: 980cd426a25747daf8ed25e2a1904b2d26ffbb3d ("staging: rtl8723bs: replace rtw_zmalloc() with kzalloc()")
>>
>> Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
>> ---
>> changes in v2:
>> -Fixed spelling mistakes(dereference, potential)
>> -Added Fixes tag
>> ---
>>  drivers/staging/rtl8723bs/os_dep/osdep_service.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
>> index 7959daeabc6f..4cfdf7c62344 100644
>> --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
>> +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
>> @@ -194,7 +194,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
>>         struct rtw_cbuf *cbuf;
>>
>>         cbuf = kzalloc_flex(*cbuf, bufs, size);
>> -       cbuf->size = size;
>> +       if (cbuf)
>> +               cbuf->size = size;
>>
>>         return cbuf;
>>  }
>> --
>> 2.43.0
>>
>>
