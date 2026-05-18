Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF6405C30
	for <linux-staging@lists.linux.dev>; Mon, 18 May 2026 04:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080386; cv=none; b=hdI0lhfe0aQwBUV5BMirFx1o0ckpTye4ILVafyMAKrJvO4qGSxwR8YYTyElXADfHyds2J3p0HHAMBU40VHJJKS2mV7hRZApt/oDUDkbS3Njhi9dwf0PWUX8ytT0J82ebl+9kwTnt3BYpjgkTz+fhPAnoJ9qDvpxcSnvI6CCD3no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080386; c=relaxed/simple;
	bh=rVrBSuvNH3EkW7XrOM7Hf7g0Qs/6KZ8qQWl/SGUFhQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0UrkHaQMLH4p1ACZH25gNLjpwIcfAmoYdC7J/xgHP03bRkISf6N+ABPeG16xdT9gDS7HTkfRzOefVm28pRC3WibFUz3U1qoeve87QIPsfAWqoSgBtBOAjjXLlKeQAui3no/eVYcSF5lsvhV8GG8mN2DCta+WgHo4o2HmZu5J2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JB4IkoFz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JB4IkoFz"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d75312379so1764642f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 21:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779080383; x=1779685183; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G9fME1SKC9JkFaJCWi37OmmhSJiAIC5sSu9AbmyNXlQ=;
        b=JB4IkoFzCiwbY1NJV4CyGbtw4v7Svm3fTiSB0rB50J3op+gPfTtUaX4+mc0uchshz+
         7jq93hSyVMS+sAkjc40f/EnYvemUjwAlQhWb8X4Fny/0Tgb3lE26ewx7VI10HmP7TW06
         d/djfASt7RplcAA4frbca6Qi1MS+MOQh1HsvddJNilE9dkO2iWyfgRcscuOLINY1iD9q
         Ci/8y5EXk7TR4/e9TSeJ/gbpIbBBehByKP5qdrkd8YzQHYl5s1eNL18tc2XuMD7JPY/C
         Zrt0wWAzk9X5YBJxj/Y8aMoma835bxemKkVjrtuDU7nQFgRUeEl0l3UzPYEnG5dGjIux
         1QSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779080383; x=1779685183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G9fME1SKC9JkFaJCWi37OmmhSJiAIC5sSu9AbmyNXlQ=;
        b=AM74siys8UXvDmK6W6NAXa+DPhmFR21gudo8RAl7FTOVp/Di7i9roXZ7jZmO50Sanb
         NoLJDZkLXDi1WEdQnSxlj1NKkC3Bo3FBKIn7jldzQ6FuxlKYbfxVzfLCF5VtiBSRmWq1
         dUwcIOu75tyvrmw6hlZ5O0rKo49se/KgXgGSEX2KbQVpRBK7alB1ZUSnJGLF+bBM1CUR
         0d2T+j/8SRompXDm0wFMHSQyIll/NP3n1ftfydMzkswf1xqdleR2h9+/hOeOfq+F0S6S
         lbpD8rcEEdih/k/0opuZD8nuJ6ehTg7UnxnAggRyk4P5oP5RdkumY/9WiXHkVEkubBvz
         gbxg==
X-Gm-Message-State: AOJu0YzEqNMYje9nNvjfUoGOzYpEU3V/6mfeNYEXqZQVEYQIueQ+ZASl
	icc9hl5f7eE/LeQtB0ChUGTZZz38RjcvzfTOjdNMAMt5c1mjUa4x0DDa
X-Gm-Gg: Acq92OF7H/OVPLrPX+mlIs485LaHX3MoqnSz6T8XrRCaxEVQsfs2maWYd6pZWMOGlAc
	8EAaZlyLTWGW8UTYVfjxNJYdfs/isO5tsxxWp4Byd+zTFXdvfA9w3ob53qOGu2fsAmxOe3FHJ91
	Nj6e6mmSAI1MDcNHRwv8cwWkfEMLWCHqLh0CsbdB088OyN/R8cMnyb4wswhjBQXOBSA5T8Cl53+
	RE3par+7UR4gDxGoPQdv0DoDYdf/QDD8Q/takN6j++AORNxfJDQ+qDTf7hbMAK5TnVl0s2B9QhN
	DZ1PdoarzNzm47JLwJ+liFySvi1pHZVDWzUoRRukbx3yGoRW39iFCTHa25MyNOoo88Z+W/Yg5Sw
	TXRFgqLHF1YIYOBTQPdTPPGe3LvMKdP4MBq/IVFCtTNb2beY3Xs7EIRpi6wzT34fTluycTt+/lu
	YFlx8K2BizFR3T7igz+f0=
X-Received: by 2002:a05:6000:2a0e:b0:43e:a8d8:f3dc with SMTP id ffacd0b85a97d-45d916264b9mr17746607f8f.13.1779080383068;
        Sun, 17 May 2026 21:59:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13b4sm34688642f8f.28.2026.05.17.21.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 21:59:41 -0700 (PDT)
Date: Mon, 18 May 2026 07:59:38 +0300
From: Dan Carpenter <error27@gmail.com>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org
Subject: Re: [PATCH 4/4] staging: rtl8723bs: fix missing brace in
 rtw_efuse_read_1_byte
Message-ID: <agqculuAIOGMBxZJ@stanley.mountain>
References: <20260516155025.230865-1-mokshpanicker.7@gmail.com>
 <20260516155025.230865-5-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516155025.230865-5-mokshpanicker.7@gmail.com>

On Sat, May 16, 2026 at 03:50:25PM +0000, Moksh Panicker wrote:
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index ef0cec40d388..a9bbfe2d6fb2 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -75,8 +75,8 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
>  		return rtw_read8(Adapter, EFUSE_CTRL);
>  	} else {
>  		return 0xFF;
> -
> -} /* rtw_efuse_read_1_byte */
> +	}
> +}/* rtw_efuse_read_1_byte */
>  

This is v3 of the patchset but it's not sent in the right way.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

You broke the build patch 2 and you're fixing it here by adding the
closing } character.  That doesn't work.  You can't break the build.

regards,
dan carpenter

