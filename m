Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092541F7060
	for <linux-staging@lists.linux.dev>; Tue,  4 Mar 2025 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741116817; cv=none; b=uxLaL9O6+HLkrjomMiWhVlk56YTbmvniHA8kERysY0w9fXBpGThLkch0EgRj4q7tw58uAvwb2k6d+24cCqEoI8tigVObjMNLOmBsRGzN/TPPlSMPs7Op2L+f9cWWS3tfZZdRv+XiK2Roew8jnrrLNsSjvNyxJrqXHNfNIpG+Ma8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741116817; c=relaxed/simple;
	bh=Fyz3JfHHOvuotSLhbCETLSUbx3X7uzkobiKMeoVFgUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkoZZ6dRFU/MVFeuPNzA3FdBnbzGd8E8Tf7BXPXlqLpveGFVVfq1YhVk2AT/DWSpBc6kXpeM9bfXFqkerV4oPSJFZWCMZb8NpPy4wXevDjhgwvq0Ib/jk2+JOkIBFK6KVfGDaVSCjD4y7ViovQ2MnqcQTWbPbVL9zmHejdUq/Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zp5kxsep; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zp5kxsep"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2235025322fso11899305ad.2
        for <linux-staging@lists.linux.dev>; Tue, 04 Mar 2025 11:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741116815; x=1741721615; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wtIegLy+r+GMqADIrfnswa2mJO1assc6TIqGWvq1Thk=;
        b=Zp5kxseplcZth15pwvUc7QcCMAsnERcd8k8I+SiXU0i/tS+iYYX/U4PI70pted3/GB
         4Ursag+lzUWieLV7BEp59vyXGp88+SxM49XYAcHOSkB0lST6W/o70E2mhpZH4lia4DGV
         mmIkLo6JFH4ZEUCKxTwUgv8oQ92nzWZVtK0+H8o34Mg/21WExCsN+8SdeLA/4sBbqrcl
         SUxbNATAeCOajDz/AnwymXJncmyBImOMcC6MlbZWaaQHwsWID3HVk4x6isAJEh+1e/cQ
         J04FjlKxwnU7FoJl6ux3iYsjRgqw38zFnfrFqs+mSxQ+zcEAMZNEvg1AR/DZjJTtP2wS
         EbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741116815; x=1741721615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wtIegLy+r+GMqADIrfnswa2mJO1assc6TIqGWvq1Thk=;
        b=tWTZc3skRhfFwlaloFquiZbhU0EdRjT014kxXwRSdS6fpaXVcPRVyAMDTfvWmZ4vMQ
         bMa7RtWwyr3Ux0jgB2wvOlc7ox5n/Wr+pT6WD9T00Fmf7P3aUvRdipRUeG3L4M/VfDlD
         1kzb1CztKzSL3aob6W91ItfSMutiL2dkqlVFj+T69ryEI2KY8uO8J95pRSDu711H05BN
         bSNqTo0dbsT54WSIrJ0f9+efAd2CRqOAsCUx1bgq25zwfiXhH3qijhvseturW/wxKETq
         v0DczfTcd/H8cLkCpSe8VTGVh7Xh8BDoVn32QFcMGZhZ0py97gEApilwt3V/SPYMlZCM
         5CeQ==
X-Gm-Message-State: AOJu0Yy+ygpkMjW3Y/wgPs2obIyhnqZFaBd530WR018k11XFlpvtLQDY
	vnYjTCUnFFtlZ0jIal4hMMKkzqqZjpU6Hhf4mfgz1TQXpCJMwPhqFkpjBQ==
X-Gm-Gg: ASbGncvSC7NlvmR5kIAHNg89+rd2VuRTccCNUpj5/Gn4XeLF/O36ny7l1R+W9lm09Iy
	90OPgHSa30qX8aq9gwxcH4P12p2jQDjHdi728MVefmlAlDnHPkmKI1EQDxgJ20FoJp2E2ffQg7h
	ZRUl/es+a7CUHyZfXMo5hnoLTRsfSMl+qhhE/pr5mmW60DOIJtYqWAdBukWJpSnJhgWYTjL5tc5
	oaCPzP+10nVTinaNygANGvAxz+5eKsZTgmnQbk0dIuhtsFnu6WVEhwuEurXryH3iJ/b315ydDw6
	23m5t8H5pUi8Peyq2+xJJXtBAp+Lei/IKsQGaZp1cJy8hooGptAJ0Hg3TFjWce6B9+fCXVIGFn0
	=
X-Google-Smtp-Source: AGHT+IGOO8Q+oMRYcQBpw0l9B2qNi9FXTCKn0LBXiMRpfwxOYA9XY/0EpSQI8e4oPMFBQPO2/mpoiw==
X-Received: by 2002:a17:902:ea05:b0:215:8721:30b7 with SMTP id d9443c01a7336-223f1d33a9dmr2163445ad.11.1741116814849;
        Tue, 04 Mar 2025 11:33:34 -0800 (PST)
Received: from debian-BULLSEYE-live-builder-AMD64 ([2802:8012:1f:3200:f1d1:c186:ba5b:8f06])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003dd19sm11660791b3a.131.2025.03.04.11.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 11:33:34 -0800 (PST)
Date: Tue, 4 Mar 2025 16:33:09 -0300
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org, 
	dan.carpenter@linaro.org, arnd@arndb.de, niharchaithanya@gmail.com, 
	jiapeng.chong@linux.alibaba.com, linux-kernel@vger.kernel.org, gascoar@gmail.com
Subject: Re: [PATCH 3/4] staging: gpib: fix kernel-doc section for
 usb_gpib_line_status() function
Message-ID: <mcagpfhzrwlvys76ketpo33l5yn2ij2csshrzz3tgufrdr5lg3@i4nmisbi3l6f>
References: <20250304192603.40565-1-gascoar@gmail.com>
 <20250304192603.40565-7-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304192603.40565-7-gascoar@gmail.com>

On Tue, Mar 04, 2025 at 04:25:41PM -0300, Gaston Gonzalez wrote:
> The function name field in the kernel-doc section for the
> usb_gpib_line_status() is defined as 'line_status'. In addition, after
> the kernel-doc section, there are three macro definition instead of the
> function definition.
> 
> These issues trigger the warning:
> 
> warning: expecting prototype for line_status(). Prototype was for WQT()
> instead.
> 
> Fix the warning by renaming the function in the kernel-doc section and
> by moving the macros at the beginning of the file with the rest of
> macros definition.
> 
> Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
> ---
>  drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> index 090857824d07..f7dd0809b06c 100644
> --- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> +++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
> @@ -78,6 +78,10 @@ module_param(debug, int, 0644);
>  			dev_dbg(board->gpib_dev, format, ## __VA_ARGS__); } \
>  	while (0)
>  
> +#define WQT wait_queue_entry_t
> +#define WQH head
> +#define WQE entry
> +
>  /* standard and extended command sets of the usb-gpib adapter */
>  
>  #define USB_GPIB_ON	 "\nIB\n"
> @@ -131,6 +135,7 @@ module_param(debug, int, 0644);
>  
>  #define INBUF_SIZE 128
>  
> +

Please disregard this patch. I noticed this blank line after I sent the
patch.

Will resend.

Gaston


>  struct char_buf {		/* used by one_char() routine */
>  	char *inbuf;
>  	int last;
> @@ -644,17 +649,12 @@ static void usb_gpib_interface_clear(gpib_board_t *board, int assert)
>  }
>  
>  /**
> - * line_status() - Read the status of the bus lines.
> + * usb_gpib_line_status() - Read the status of the bus lines.
>   *
>   *  @board:    the gpib_board data area for this gpib interface
>   *
>   *    We can read all lines.
>   */
> -
> -#define WQT wait_queue_entry_t
> -#define WQH head
> -#define WQE entry
> -
>  static int usb_gpib_line_status(const gpib_board_t *board)
>  {
>  	int buffer;
> -- 
> 2.49.0.rc0
> 
