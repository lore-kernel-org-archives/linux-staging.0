Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9B612B177;
	Tue,  5 Mar 2024 22:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709676074; cv=none; b=eecNUl+pCjMap0uEiHAxrVlBx+Pe2VIbAu3fMAoECgvnl01VIUkt2/122pOh50Gq5LzU9moIZop901K68PhPYXf/+1EeOc0uMGANSnvdeiDoMyCDlNGbwBucFrbxqqLPA/EBQIByEaSDw3ZjONh4DJUDvBqrYNyeyBPLnB787/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709676074; c=relaxed/simple;
	bh=ntHKB+NHaDEre3jMnjb6OI14P6JCx10rpXsBvejuk7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UUo//v1ZkLq2busWZoXJpp5MCnzsWPrKM3NrM2d0yJfsJ2PIh5i8BpUoFcvvsQ21Wt/5Kvnhknn8cmDimQuTK7kbo1epeiMINdFclixzTzk8QtPJzCcoyNz8k8uzw7gMxuTOb4SZJ1vHhp+inbzPwf3zNgBdoNKlEdkGdLRPvys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XH5TVn6/; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XH5TVn6/"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d35c22c1ebso10375621fa.0;
        Tue, 05 Mar 2024 14:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709676071; x=1710280871; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QR9tHd9fogBVGSROxRPvRO/kV0E5Pf302WLJWJ3jpJY=;
        b=XH5TVn6/YKC6HWBXB7eoHWVB//fnXjtQURGbEjvYnO0q2gZlYMnr/sID91Th0CmKl6
         AfU+1cfBNhoTOlogNVFD98clobl1VhMsQCsA7H594ijAjHStcniwHfltTv8JgSTikAO1
         0Kuv5KujW3vE+wOlBIMUGsFf9hqXXPi4GMZJy4Qtz5bi9fFkRxndfeDVAzXGeQ22Q+xG
         1FDujp2qHfCyHci9fKTHUiF/Vyt5mYSdmgWWVeoLMkjx4ZTVgBnWrpfBUr50j92T+ocv
         yTcW4Aq/oLuyuXKHNF+s9fZ5tZi8PbIFcSRSYVCR2lG9kxSf5r1lokyh+4moHgKDTT1U
         1Fbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709676071; x=1710280871;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QR9tHd9fogBVGSROxRPvRO/kV0E5Pf302WLJWJ3jpJY=;
        b=E+BolYKGB9kTzmPObfr1TUn/2ZBRjjkZ2Ptmiv6/vSPKiRrXJRx8Gjd6S4bHjNwxVw
         QBnjcxDnhT0WZBvq5GVD3Tsxmw9nNTu40lWfIiEUN00ynWFHpw9NSWMYzVarrgcLKEJb
         +BvxkXJcZE1Cl7uT9dEr0tC1U9z4yo943jL4DySLvTdXhdgC7PBrUFxJV3QrZukloz90
         QSLSE7yV/z5wTCK5WjdkazZYIbvVVhcNMOzSHmOX4iWNRheKQvkew6k38wQ2p0kEwmKc
         QpsfgQeob0DG1cMIjQQpSyi6p5cBBVn3SJpDZwTY+09Lhs6Bf6vP1eP7mcCO7tewv2hj
         briA==
X-Forwarded-Encrypted: i=1; AJvYcCW6FflgyUMbV6bR5mp+LQ67bC1CZ4Fi47vIr14QpTdDywYP/ymhLtO0aomBUxk7Rdm4uaM/urxzqtjMCaELjtcze+JbYbS6goZWavnsvA+tnbEDX+IInvnM7U1DGrvT8Q/i7WpAqtexOw==
X-Gm-Message-State: AOJu0YyR2sQFSOmswGqgo+ixEVz8+qplsXljTo9R+OSIWTIs86WB1eKv
	AwRXh05GHg/JdCYOSovTqU88se148zBKTYxr8NVdBAAn6/gQEGKk7F1nXFKk/Zs=
X-Google-Smtp-Source: AGHT+IEvJQ4TuM2+bhRSm4w36/mqdsWSknDtj+J+6NJ30DLQLcaUxRG2t/CBDos/oBlG1msV+Y1T+w==
X-Received: by 2002:a2e:9b92:0:b0:2d2:3b8b:ae76 with SMTP id z18-20020a2e9b92000000b002d23b8bae76mr1012577lji.1.1709676070875;
        Tue, 05 Mar 2024 14:01:10 -0800 (PST)
Received: from [192.168.0.102] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id t1-20020a056402240100b0056671c5c1a1sm6299598eda.80.2024.03.05.14.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 14:01:10 -0800 (PST)
Message-ID: <f76416c1-157f-4c31-8443-a63194a630be@gmail.com>
Date: Tue, 5 Mar 2024 23:01:09 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] staging: vt6655: Match open parentheses
Content-Language: en-US
To: Dorine Tipo <dorine.a.tipo@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, outreachy@lists.linux.dev
References: <20240305091410.2798-1-dorine.a.tipo@gmail.com>
 <20240305093213.4280-1-dorine.a.tipo@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240305093213.4280-1-dorine.a.tipo@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/5/24 10:32, Dorine Tipo wrote:
> Align the function parameters to silence a checkpatch warning.
> 
> Signed-off-by: Dorine Tipo<dorine.a.tipo@gmail.com>
> ---

Hi Dorine,
I tried to apply your patch but it failed. I do not really understand 
why. Have you edited the patch manually or was it created by git?

Thanks for your support.

Bye Philipp

git apply --reject --whitespace=fix ~/Downloads/20240305*
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git apply 
--reject --whitespace=fix ~/Downloads/20240305*
Checking patch drivers/staging/vt6655/card.c...
error: while searching for:
  * Return Value: none
  */
static void calculate_ofdmr_parameter(unsigned char rate,
				       u8 bb_type,
				       unsigned char *tx_rate,
				       unsigned char *rsv_time)
{
	switch (rate) {
	case RATE_6M:

error: patch failed: drivers/staging/vt6655/card.c:81
error: while searching for:
  * Return Value: none
  */
bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
		    u64 bss_timestamp)
{
	u64 local_tsf;
	u64 tsf_offset = 0;

error: patch failed: drivers/staging/vt6655/card.c:288
error: while searching for:

	if (bss_timestamp != local_tsf) {
		tsf_offset = card_get_tsf_offset(rx_rate, bss_timestamp,
						local_tsf);
		/* adjust TSF, HW's TSF add TSF Offset reg */
		tsf_offset =  le64_to_cpu(tsf_offset);
		iowrite32((u32)tsf_offset, priv->port_offset + MAC_REG_TSFOFST);

error: patch failed: drivers/staging/vt6655/card.c:297
error: while searching for:
  * Return Value: true if succeed; otherwise false
  */
bool card_set_beacon_period(struct vnt_private *priv,
			  unsigned short beacon_interval)
{
	u64 next_tbtt;


error: patch failed: drivers/staging/vt6655/card.c:321
Applying patch drivers/staging/vt6655/card.c with 4 rejects...
Rejected hunk #1.
Rejected hunk #2.
Rejected hunk #3.
Rejected hunk #4.

