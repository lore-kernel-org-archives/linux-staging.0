Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFB054F95;
	Mon, 11 Mar 2024 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710185477; cv=none; b=mbf9MI/lDrB3uVU09IPt2y0kNZ2cC7hLMxu+TYkdZMyodRYvomQD12Vg63B05PZIU0Ef6eOJ7pWtUmS4IKRxjtA/NTWpiLlZEjmYTgv+JTsV2N3C9oxi3sFq2i2A2tXTcOqtrFgcVcg16lNozgI6qz8bt87yiVWtZkBADLb6heA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710185477; c=relaxed/simple;
	bh=AC1uPRCZj/8wnOJitSEIWUojwXPSwENw/WWJYgzkVrg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZkd35ow0+jhkA8PCBLf+uxVV3ZVjxRe2KH1OgAvOM2ZxJBeGKJjxK/+eQ6V+uwb/uMe+pryCpnNyrKBTHlWAFnubBVVPEqQKsvU8NKux25AnxbxaBscxa6p+an78o93s/DEo6jyn2tKTVX5GN4hznWy3OXXt4rgGcSeiE0EtsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHmKeCi7; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHmKeCi7"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a455be159fbso65210266b.0;
        Mon, 11 Mar 2024 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710185474; x=1710790274; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DGD/K7PbcPXhTYr2ynjthnXfGqD/UYdkpGpwMVFT2yE=;
        b=AHmKeCi7V84KrNmAyOxewUtiK3o2hnHhsVTYKH6aH/R71Hu/TiAelE5zpbp88MHERW
         /a0xH/fK19BRasrbXyyyLKc8W/C/5eJBm7tmIAs1zPalXCDsAuRUVmtvFFJlsRTmmxPt
         fM0sIY1AeYcmtS6Q/SINhK2Yd4g7reCKSz2OMT7pLXZ5vqzF70No+mNrWFpPZNNyJy71
         tJQ/wca06ElNfmrwE7oO1LoCVWALpfyRxuxPdcFjfJkwa+lhwhdTcpP3oeWgqMr6xUDA
         UpJh38RfiMXuQZ1509i0JmxVlM2s+2IruN840yr3FCCokDXcjigg8hMOgqBM5xvKNI4t
         85tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710185474; x=1710790274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DGD/K7PbcPXhTYr2ynjthnXfGqD/UYdkpGpwMVFT2yE=;
        b=a3ot18i8jsV1BI2rNOOs7AjQYbEBtq0AwzT0FQywo+DGkEt+bj8tsxRhP6c/bagD1Q
         ebTQayD8AMZPv+pjDgflvD+ylmR8DR9ox8cZMNyFK7jeg/C0qTgIc0+HvNfSwu66en0J
         nIXd+0YisxBkHL/bl7ixMVFwGr7sGAD9ozsKROQL7k6ouqx22tKa/5HGDsWBetmgsJlb
         0dOjt+rl7Yx6nXtFWyvsxM2eOafbj97f8IZT1CWDaQRkE/LXjgb6+hdM1Mmm31Eql0pr
         8C1fcr7xQx4HktN+ZTQx+7U9OhJwtHU9DdPBeq9OHa767Y2K3PNa9h/MfHzBJLcoDYrS
         feJA==
X-Forwarded-Encrypted: i=1; AJvYcCXUNQ6vmzZq2IaBcNm44W8ARG1RXbfajKvMcd04y897wFrbbsCfI3V6V9oZBjDZX259epYa7YlB+6774vLHC4Fgg17YfWSrPdX9haqguA==
X-Gm-Message-State: AOJu0YzinOfuVQUMucQUY9svbPJ18hDZljLtKVnnGzvLGpy7Jst+Wtob
	LMJlrQ19CYP14PKrqwAjhuuIjIdy6N8HC7PxhcMn88rdzZj+/RZ9
X-Google-Smtp-Source: AGHT+IFCp9YWXjL3GAKRj2gE9ehP0MXbh1gQhiEBhuAGk6m7UJhFvSbXcrXdc9w5PdZO+BaVqhGd/A==
X-Received: by 2002:a17:906:3087:b0:a45:da91:8d29 with SMTP id 7-20020a170906308700b00a45da918d29mr4784404ejv.2.1710185474164;
        Mon, 11 Mar 2024 12:31:14 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id oz14-20020a170906cd0e00b00a44a859fd9dsm3188581ejb.174.2024.03.11.12.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 12:31:13 -0700 (PDT)
Message-ID: <6d643351-8924-4c86-9fb5-9951e016f5db@gmail.com>
Date: Mon, 11 Mar 2024 20:31:13 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: p80211conv: Rename local foo to decrypt_check
Content-Language: en-US
To: "Felix N. Kimbu" <felixkimbu1@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
References: <Ze9Ie67PCSvBU+og@MOLeToid>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Ze9Ie67PCSvBU+og@MOLeToid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/11/24 19:07, Felix N. Kimbu wrote:
> This change renames the local variable foo to decrypt_check in functions
> skb_ether_to_p80211(...) and skb_p80211_to_ether(...), giving intuitive
> meaning to the identifier.
> 
> It also indents the parameters to match the the opening parentheses.
> 
> Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>

Hi Felix,

I think the subject names the subsystem "staging" and then the driver 
which is "wlan-ng" the file can follow but you cannot omit the driver 
name.


Please check the following checkpatch warnings:
File Nr: 0    Patch: ../../../Downloads/20240311-[PATCH] staging_ 
p80211conv_ Rename local foo to decrypt_check-15036.txt
WARNING: Possible repeated word: 'the'
#11:
It also indents the parameters to match the the opening parentheses.

ERROR: code indent should use tabs where possible
#41: FILE: drivers/staging/wlan-ng/p80211conv.c:189:
+^I^I^I^I  ^I^I^I^I^Iskb->len,$

WARNING: please, no space before tabs
#41: FILE: drivers/staging/wlan-ng/p80211conv.c:189:
+^I^I^I^I  ^I^I^I^I^Iskb->len,$

CHECK: Alignment should match open parenthesis
#41: FILE: drivers/staging/wlan-ng/p80211conv.c:189:
+		decrypt_check = wep_encrypt(wlandev, skb->data, p80211_wep->data,
+				  					skb->len,

WARNING: line length of 115 exceeds 100 columns
#42: FILE: drivers/staging/wlan-ng/p80211conv.c:190:
+									wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,

WARNING: line length of 105 exceeds 100 columns
#43: FILE: drivers/staging/wlan-ng/p80211conv.c:191:
+									p80211_wep->iv, p80211_wep->icv);

CHECK: Alignment should match open parenthesis
#72: FILE: drivers/staging/wlan-ng/p80211conv.c:309:
+		decrypt_check = wep_decrypt(wlandev, skb->data + payload_offset + 4,
+									payload_length - 8, -1,

total: 1 errors, 4 warnings, 2 checks, 58 lines checked

Thanks for your support.

Bye Philipp


> ---
>   drivers/staging/wlan-ng/p80211conv.c | 30 ++++++++++++++--------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/staging/wlan-ng/p80211conv.c b/drivers/staging/wlan-ng/p80211conv.c
> index 8336435eccc2..a0413928a843 100644
> --- a/drivers/staging/wlan-ng/p80211conv.c
> +++ b/drivers/staging/wlan-ng/p80211conv.c
> @@ -93,7 +93,7 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, u32 ethconv,
>   	struct wlan_ethhdr e_hdr;
>   	struct wlan_llc *e_llc;
>   	struct wlan_snap *e_snap;
> -	int foo;
> +	int decrypt_check;
>   
>   	memcpy(&e_hdr, skb->data, sizeof(e_hdr));
>   
> @@ -185,14 +185,14 @@ int skb_ether_to_p80211(struct wlandevice *wlandev, u32 ethconv,
>   		p80211_wep->data = kmalloc(skb->len, GFP_ATOMIC);
>   		if (!p80211_wep->data)
>   			return -ENOMEM;
> -		foo = wep_encrypt(wlandev, skb->data, p80211_wep->data,
> -				  skb->len,
> -				  wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
> -				  p80211_wep->iv, p80211_wep->icv);
> -		if (foo) {
> +		decrypt_check = wep_encrypt(wlandev, skb->data, p80211_wep->data,
> +				  					skb->len,
> +									wlandev->hostwep & HOSTWEP_DEFAULTKEY_MASK,
> +									p80211_wep->iv, p80211_wep->icv);
> +		if (decrypt_check) {
>   			netdev_warn(wlandev->netdev,
>   				    "Host en-WEP failed, dropping frame (%d).\n",
> -				    foo);
> +				    decrypt_check);
>   			kfree(p80211_wep->data);
>   			return 2;
>   		}
> @@ -265,7 +265,7 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
>   	struct wlan_llc *e_llc;
>   	struct wlan_snap *e_snap;
>   
> -	int foo;
> +	int decrypt_check;
>   
>   	payload_length = skb->len - WLAN_HDR_A3_LEN - WLAN_CRC_LEN;
>   	payload_offset = WLAN_HDR_A3_LEN;
> @@ -305,15 +305,15 @@ int skb_p80211_to_ether(struct wlandevice *wlandev, u32 ethconv,
>   				   "WEP frame too short (%u).\n", skb->len);
>   			return 1;
>   		}
> -		foo = wep_decrypt(wlandev, skb->data + payload_offset + 4,
> -				  payload_length - 8, -1,
> -				  skb->data + payload_offset,
> -				  skb->data + payload_offset +
> -				  payload_length - 4);
> -		if (foo) {
> +		decrypt_check = wep_decrypt(wlandev, skb->data + payload_offset + 4,
> +									payload_length - 8, -1,
> +									skb->data + payload_offset,
> +									skb->data + payload_offset +
> +									payload_length - 4);
> +		if (decrypt_check) {
>   			/* de-wep failed, drop skb. */
>   			netdev_dbg(netdev, "Host de-WEP failed, dropping frame (%d).\n",
> -				   foo);
> +				   decrypt_check);
>   			wlandev->rx.decrypt_err++;
>   			return 2;
>   		}

