Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74643E0C41
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357367; cv=none; b=Y86u5HAAi4zuwv4qclRGtfa08aJ4EjYyzj0Ot9fhYr1wUjvEi2xF4S1HWiPNcXEAUPsScNaLhiO0gsNuddEfxtOPF8wW3O/tQqYK5fpr/nW7bQcuSAVJ4XAQ7UwpBZ2Q00LB/LPqQPYXfe3HHAtJLWD+d5/U1C2VQakp/f8zb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357367; c=relaxed/simple;
	bh=RmqeKADRjb23/XFXR/Rq5tjpO3ak8LjxoL9DZbkDDZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3RQqSC3GACPr9JkWi52M0npJhgI+w0iJ+1B66xxzoOqDA3U4GpjKz88ho9pfmw/p7zWyHclRTmGTSwXU3izSMmnx+rCfGU7E55rrbpFtlYGjV9xPt5csZc3Qd0CAxAV/zPMh+a3Q85vYxdoUShNXeSs+t18wWbsjaCw2ms635s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YiFAPnWZ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YiFAPnWZ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ab46931cf1so52087875ad.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 06:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774357366; x=1774962166; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J2nRwHjOc3gST7hK0d6yqsf6Eet2tL2gJyEtlEu4A7E=;
        b=YiFAPnWZpkHoFxskIVdjVXZf95Wz3WN9vtvJGkz8LNrJQun5SdMqHz7dsHseguYiG9
         qF2IdpmqAPZwPj6/eFbqVRbBq+d3abZKW1PFwLHl2va5mJSM8+mVtI+5zin7I7aDClWX
         a6EO/4ckXi6t1+H9F6rPx7vgZBr8QsUKfUNWhO2/0i+VwWWQDSJPV6ois+pEdpHuK/aW
         ScsYktg7HYIASyGy74YLlF4vuddIVKWOL7YPN5IGSSr+DEGnydfsukpKPbPj0E00xdmx
         nuPEaKsRCu6BDZp7mnibhUB1QMfrCpal2EL7C5JfIALmpj5NPgkUQOK2kHY76SEuvF9a
         +yLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357366; x=1774962166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2nRwHjOc3gST7hK0d6yqsf6Eet2tL2gJyEtlEu4A7E=;
        b=mlgIMh/QQfJslDMxffm+9fV55tpOa6VBeEf5iu3uh2kyxZP7TKK6L1/+W7QLn+3Cnj
         Upl1D1Hkn3UwMdhpetjT8W++EnHTbCQdfejBWlBKtkSu/i96wp4HoCvztslsy8Oqj5TT
         lrUOTS9WVasH2tnJlC3h+Cj2SqrseCWrPOU4MYMglUx9459mLYGe9rL+zTT1wRtEA/1P
         Aks1JYPp20b/qXAP/Y8wbvtzpdfgPIgxZI3rmEqmEEoY0Y8i5hGc0avxYGKOHYCmHVsk
         50wo/TbPiSpCk9gskQlZcRpVP++/Qwi8HenrW6AaieIKK0IhtKSr5Zc2H7v5XTSxhSG4
         /t9w==
X-Forwarded-Encrypted: i=1; AJvYcCXfkJk6jkS4wtDhYctqrS7ooh/Z77EXBgwWAV1LmyudlRcDjEO5+xBiXAucSWyEGWCO2fwJ8eUJ62JpTR+1@lists.linux.dev
X-Gm-Message-State: AOJu0YwLOZgY+EMTNN+HKq3GWyZSdoRV8CHGljxrE0mXlGr2OP6rSgYP
	bQrvdzV2N3y/vV00Yj0mskkjh4hk7ccYyGOg0KxPbHZOsqodM9wq0vEA
X-Gm-Gg: ATEYQzxu6+5G1TMDYmisztibe8Fx8aIbdCp9Q2WTTKUd0AUP8dQ+JqiBZQ/TOpdnC61
	QrDh01k0HIOZ7s1hK9h+0Ko8a/uGDQxHqo9wjDq0a3Gv/CMtimSeLmJPy6m5MLOItEq2Bh85vsJ
	DZKXXVIjUSroMoME/dLyCHURXZjFevEb9I3wa1z/QqMnNDa9sQdxc6YM4cFJCi2/iX86G4ct9en
	KNGdXe5asVIlgwk4QWib3Znq+OTqf9elPjTgVZ82FGeloASuNuSwRvy9BT3f0n3W4wQq2G0VBMz
	WqtSxb7vGwZqX+WBJLXAU6SttinJPBPms3H7Y5o30sA9gm2QIDyTEbOqHwDoWe85LvnYQ6zYo3l
	Pu3sfSx2ntfh8ZVudxF6rel09/zeKtFOcI0xlcHZpeaGPEorbgtkChJ/oPcDOqku9MH3j/HdoPX
	PiSASJULe7fqpmnuUGV+a56k21UpGx62SG8w==
X-Received: by 2002:a17:903:388d:b0:2b0:51be:f9d7 with SMTP id d9443c01a7336-2b0a4e05583mr31217165ad.18.1774357365485;
        Tue, 24 Mar 2026 06:02:45 -0700 (PDT)
Received: from inspiron ([111.125.240.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352ae70sm154190065ad.23.2026.03.24.06.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:02:45 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:32:34 +0530
From: Prithvi <activprithvi@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	straube.linux@gmail.com, b9788213@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	weibu@redadmin.org, knavaneeth786@gmail.com,
	ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
	lukagejak5@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, suunj1331@gmail.com,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: fix constant on left side of test
 checkpatch warnings
Message-ID: <20260324130234.3776tp4ykuerffcg@inspiron>
References: <20260323162901.121947-1-activprithvi@gmail.com>
 <acFtiaXTp7bwl604@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acFtiaXTp7bwl604@ashevche-desk.local>

On Mon, Mar 23, 2026 at 06:42:49PM +0200, Andy Shevchenko wrote:
> On Mon, Mar 23, 2026 at 09:59:01PM +0530, Prithvi Tambewagh wrote:
> > In all types of comparison/test (using ==, !=, >=, <=, >, <
> > operators) ensure that the constant lies to the right side of the test,
> > thus fixing checkpatch warnings : comparisons should place the constant
> > on the right side of the test, throughout the rtl8723bs driver.
> 
> ...
> 
> >  	do {
> >  		valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
> > -		if (0 == valid) {
> > +		if (!valid)
> >  			read_down = true;
> > -		}
> >  	} while ((!read_down) && (retry_cnts--));
> >  
> >  	return read_down;
> 
> This entire piece can be replaced with something from iopoll.h.
> 

Yes...I checked out and found we can use read_poll_timeout_atomic():

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 25bc11ac874c..6fa694ce27ec 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -9,6 +9,7 @@
 #include <rtl8723b_hal.h>
 #include <linux/etherdevice.h>
 #include "hal_com_h2c.h"
+#include <linux/iopoll.h>
 
 #define MAX_H2C_BOX_NUMS       4
 #define MESSAGE_BOX_SIZE       4
@@ -18,18 +19,17 @@
 
 static u8 _is_fw_read_cmd_down(struct adapter *padapter, u8 msgbox_num)
 {
-       u8 read_down = false;
-       int retry_cnts = 100;
-
        u8 valid;
-
-       do {
-               valid = rtw_read8(padapter, REG_HMETFR) & BIT(msgbox_num);
-               if (!valid)
-                       read_down = true;
-       } while ((!read_down) && (retry_cnts--));
-
-       return read_down;
+       int ret;
+
+       ret = read_poll_timeout_atomic(rtw_read8,
+                         valid,
+                         !(valid & BIT(msgbox_num)),
+                         0,
+                         500,
+                         false,
+                         padapter, REG_HMETFR);
+       return !ret;
 
 }

Is this approach correct?

> ...
> 
> > -	if (WIFI_CTRL_TYPE == GetFrameType(pframe))
> > +	if (GetFrameType(pframe) == WIFI_CTRL_TYPE)
> >  		return true;
> >  	else
> >  		return false;
> 
> Just
> 
> 	return GetFrameType(pframe) == WIFI_CTRL_TYPE;

Sure...I will incorporate this in the next version of patch.

Thanks,
Prithvi
