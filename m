Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7836D1FA0;
	Mon, 11 Apr 2022 21:14:17 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id j6so12242519qkp.9;
        Mon, 11 Apr 2022 14:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=pkqd/GLpbqG7LAJ4m2LQWbg8yZe6P+EQh4+ijIpHwnY=;
        b=OO+sNYffcThi1xuROkKjBvJC05pcnrdx9WCnKGlHC58OIFg0RJeLekSfy1X5KM4QNk
         bjwKEyighYrUdxNUKxrkvNYNYWPxxatIbz2q+L40irGMA0JDZMD/Ixs04jHpp+vhPOKv
         QI2RRomlpipb3L+lAycz6Op2Ql1UfTXHVjLfzN23LO7fD+CpaHgUb6YBg46eFtTm4MnU
         MgJn8UytsHLcKOoUK7Ia5lonrpbyMk68bk49IYduea0dMG8D6dQsJvbUOF7q18bVdbMA
         w4/tjBahZ9KkqYX1lY7BibX+7ZwN1IKzuJc6zfhXrGVMlmCUFNrSfNOePO2382E0ryll
         FNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=pkqd/GLpbqG7LAJ4m2LQWbg8yZe6P+EQh4+ijIpHwnY=;
        b=OkGoU+io1Tfu3oBgz1vyrd+dsFMpVfERIjNgq46QZioUG/DWbYNUwwUvxiIvbTtchX
         XxzWYc8N0f1XlIV7A//jpggS/lQ6hR5pQhBLL6h5L1K/viDRIJwXNAxBuVNSoLR0ga9G
         +dJGR5OSK8o939OzzWjRO+9nIfAuFbrdB2BhYz9j79msfEb07+a0Prfj29HIfhof6vlG
         Q+nOMTLMCjLjbjIF763TJ87fOm6FSywi94QrzrTYP76J2OMLROE3GmT9VUsbmMr7vVcL
         mB08uE/LQ7h9/UZA88TzyEyE5z/EKn2be8VMgU7UffXf6QIkRlNIFDENzgDf3rUSWP3Z
         vBQA==
X-Gm-Message-State: AOAM532WQtmAuO4pZhALkToWv3AubKeMsQi+Gzfup58tWNutfAudH4M2
	WGq98TZdn8eDbC74MO0XX1U=
X-Google-Smtp-Source: ABdhPJyn7F36KNFwMXSCnqIDUv0dsKQ0NTeXHJoevaRzT0RVRooVRLQYT1yzOqDcZvA56oJwefUpdg==
X-Received: by 2002:a05:620a:1a99:b0:680:f33c:dbd3 with SMTP id bl25-20020a05620a1a9900b00680f33cdbd3mr970653qkb.17.1649711656365;
        Mon, 11 Apr 2022 14:14:16 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id c134-20020ae9ed8c000000b0069bf8f9cfb2sm5123158qkg.118.2022.04.11.14.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 14:14:15 -0700 (PDT)
Date: Mon, 11 Apr 2022 17:14:11 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	Jaehee Park <jhpark1013@gmail.com>
Subject: [PATCH] staging: greybus: replace zero-element array with
 flexible-array
Message-ID: <20220411211411.GA2796005@jaehee-ThinkPad-X1-Extreme>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Zero-length and one-element arrays are deprecated. Flexible-array
members should be used instead. Flexible-array members are
recommended because this is the way the kernel expects dynamically
sized trailing elements to be declared.
Refer to Documentation/process/deprecated.rst.

Change the zero-length array, buf, in the struct 
gb_usb_hub_control_response to a flexible array. And add wLength as a 
member of the struct so that the struct is not a zero-sized struct.

Issue found by flexible_array coccinelle script.

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---

I have a question for the authors: 
I saw a fixme comment in the hub_control function in usb.c:
/ FIXME: handle unspecified lengths /

I was wondering why this comment was left there?

In this patch, I'm using this struct:

struct gb_usb_hub_control_response {
    __le16 wLength;
    u8 buf[];
};

And instead of using response_size, I'm doing this:

struct gb_usb_hub_control_response *response;
And using sizeof(*response) as the input to gb_operation_create.

Would the flexible array address the handling of unspecified lengths 
issue (in the fixme comment)?


 drivers/staging/greybus/usb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
index 8e9d9d59a357..d0b2422401df 100644
--- a/drivers/staging/greybus/usb.c
+++ b/drivers/staging/greybus/usb.c
@@ -27,7 +27,8 @@ struct gb_usb_hub_control_request {
 };
 
 struct gb_usb_hub_control_response {
-	u8 buf[0];
+	__le16 wLength;
+	u8 buf[];
 };
 
 struct gb_usb_device {
@@ -102,16 +103,14 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
 	struct gb_operation *operation;
 	struct gb_usb_hub_control_request *request;
 	struct gb_usb_hub_control_response *response;
-	size_t response_size;
 	int ret;
 
 	/* FIXME: handle unspecified lengths */
-	response_size = sizeof(*response) + wLength;
 
 	operation = gb_operation_create(dev->connection,
 					GB_USB_TYPE_HUB_CONTROL,
 					sizeof(*request),
-					response_size,
+					sizeof(*response),
 					GFP_KERNEL);
 	if (!operation)
 		return -ENOMEM;
-- 
2.25.1

