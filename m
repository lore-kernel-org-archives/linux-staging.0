Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905923CF208
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 08:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782204629; cv=none; b=Rs1QUKioCqpbxiRBN/HpIIduko6KBGU/HRrHH8pmK6yRdI2FddxD3Fbw63x+mr4cAX/W+HcvBLRWhPvKGmY6d1BMxMehGKFtbtbgE49bdawabetVYNzpwt3VAAsUDfcVfo+vJYUyM9pVvDcoSSs2FuRpOriENxaKnsCiIFuaBXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782204629; c=relaxed/simple;
	bh=TZ0+5146xwe6OT/CbQdW0d6uHCZxJf8UjdEd5HflsKE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AKKVfUhG6zwF4xY7jeb3Zg6ZWlpMt/pS+u13Ti1IHm6DxCaplPc+WcQhqCXCqV93kYtae2Cp2MxbagIvPcrt+tnHCzMIQ8J8aRllZx5Dfr99CGULpAl1CJqI9YXyiYynkXNsB1BBi9c+p/Pmv6Rj/rs7oiu17Lp48IEuIX6zYiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VLXev5I+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VLXev5I+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782204627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BuoRitIZndRdwR/IA+zUZeOYUkqVtr5e2wU2WIH4U+g=;
	b=VLXev5I+12N7JJpCUFSYLSN5nUOMRsfJZb3gisX9+MkjRneGKOduMliETLXXGtUJFpUyFT
	0uXkwxr8ttszHoYSD8NyZ3eVZ1XNTW8HSIcvfSlJuLXTXwNE4CML4v5LJSic35AKN6RzTf
	W0TfaO0Q+2+bWMXLVS+n+eGYFSbviSI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-3-ikv5j1Pey01yByr7cfDA-1; Tue, 23 Jun 2026 04:50:24 -0400
X-MC-Unique: 3-ikv5j1Pey01yByr7cfDA-1
X-Mimecast-MFC-AGG-ID: 3-ikv5j1Pey01yByr7cfDA_1782204623
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490b0682d2fso39935415e9.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 01:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204623; x=1782809423;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuoRitIZndRdwR/IA+zUZeOYUkqVtr5e2wU2WIH4U+g=;
        b=nj3WET/HY4BKgwWznKmNHoO8pHeJ4iFW+OuRQyNJh5ozBA+tb+MRKDKA5M7LJEVCLn
         eUfSGt7jwgiQza7hkvXTu7+GZgdwggw1XORk5hYo51p8+lto7/JBmSbCfOokD7V5T0Bo
         Yiv0cDfqc8G+nr8QNEyhaje+FY3ZRbGVMxjSDVtmABhpA4nhDn1po72kMmjKx/dhKRFr
         RFzPjazz+MIQfC34CWrH7J3AxeVtMOEU9wUdh0C+qxnnYpIEM+gNMykBffaOv8a7A7WE
         yffst/JRIRZYh7YW9PYS/pfhSZYtFLue2YS5Iuq9/X5wTPj5WtMO2Clj9a+poEhZ98de
         zVUg==
X-Forwarded-Encrypted: i=1; AFNElJ9ja8NiUn2VlF932lPbuJZNEq7Rqzn3EmP+J4pzDMxSAuVFb8axpAbFqjSj7riH5V6iAokspl3RzzJUJA0z@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5IGIYXMRsZo9Zo8fDp/5OAlf61PvDxY9svqVoYcekzRf1Z+LN
	GzFxh0uwpZTw1Jh0Wt7MpKnmqsvLhSlVlvOpSnw/zWD6swgPbQphDxmYvUXMPKrUdOMjAt8+UT5
	iAqesEu4VxVm3pSOWiadm641yvo6QoudGW6dz0o3lhJKzKStt0GVpksJqqBCNG0gEoDY=
X-Gm-Gg: AfdE7cltyTgaxqw5r/5KFC1INJ1aiL9+eIrrJn7w9hFkz87hlmcVn2efuZD4Wafh7TB
	A7GfteCRv8jTEnbMcc5X1xUfym7Lv1QKbRCjws/0tVdogwOdMfX+a0HoFL6Xoqz39qOjkty1J5/
	bNjM8qRICG0M0d2PHDXw8H+IN1eIYhigDKhJ7Heh+oWw3szJDguMxJGUwekJrnyUxXfkr8azPyN
	PFtDA7RzzuH2dFJk85eiQilwpDy9A+l3Id+3FuCE0WpN//O+RvkoWZL5MwglWDxn8suFHnJa1o7
	5Vuualq41MsAJrbqGsjggIvat2tkD9us3M1ftOg1QY+PguoyODsDwTjnRwx11q8i9CDWEnV7Lan
	w+CoP/I4/v0gBFizY2F+RcF6wO9tALKjYhyJWBeSHIvhw5kcC86BTjtAVocg1jtg1DJNSqQ==
X-Received: by 2002:a05:600c:4503:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-4925b3896ffmr24629435e9.2.1782204623022;
        Tue, 23 Jun 2026 01:50:23 -0700 (PDT)
X-Received: by 2002:a05:600c:4503:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-4925b3896ffmr24628745e9.2.1782204622485;
        Tue, 23 Jun 2026 01:50:22 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923ff8a9e3sm389322615e9.14.2026.06.23.01.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:50:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Amit Barzilai
 <amit.barzilai22@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andy@kernel.org,
 gregkh@linuxfoundation.org, deller@gmx.de, azuddinadam@gmail.com,
 chintanlike@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 4/4] staging: fbtft: remove fb_ssd1351 driver
In-Reply-To: <ajpGy7K4eM8oJIfD@ashevche-desk.local>
References: <20260622152506.78627-1-amit.barzilai22@gmail.com>
 <20260622152506.78627-5-amit.barzilai22@gmail.com>
 <ajpGy7K4eM8oJIfD@ashevche-desk.local>
Date: Tue, 23 Jun 2026 10:50:20 +0200
Message-ID: <87ik79iqsz.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u0oIWW9AtxxGXVEhO9q126bAUft1ft5U08CnybnVb9o_1782204623
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Andy Shevchenko <andriy.shevchenko@intel.com> writes:

> On Mon, Jun 22, 2026 at 06:25:06PM +0300, Amit Barzilai wrote:
>> The SSD1351 support was added to the ssd130x DRM driver. To avoid
>> confusion and irrelevant updates, the staging fb_ssd1351 driver is
>> removed.
>
> NAK, the fbtft has two drivers in one (SPI + parallel), plus as Maxime said,
> it has its own binding.
>

Yes, I agree that we don't want to delete the fbtft driver.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

