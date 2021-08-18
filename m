Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457D02FAF
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 08:19:41 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id i133so1358979pfe.12
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 01:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yWCs2vRunxYw/2LTzrenXx3FyLmYWTHbkmxW6S9lQ6o=;
        b=Xbs1PlLLSpgp12XsSXiO9dHPBqg046u+axGYHh61zauRi4wHisoKZ7piU+aThX5HKw
         S7Y0f8OZzYpNGPMlJr6OxgJYf+e1PUiUInGPJuunDc0zaX77q7DSeYJvr8QW262gPZ6l
         wmMwpGYF4yFre3/oBCHlAprBCkbfUzTwbpJ8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yWCs2vRunxYw/2LTzrenXx3FyLmYWTHbkmxW6S9lQ6o=;
        b=sesMiuvl7y2MHhfJX43XE2Hpp667s2J9FRz+VavWGbiAJYyqvSRKD24TCIcYgQ2qyK
         Qw2ow/EKUVhZ78Q8tOWeUnA34HJ0DyqN2d2Mo7KjWQaL1HB74vY+OwtZ9Y2pFnfJ4Frs
         4GhqQluqkiyhVZNXqknuKPcZD0BmTyiTUybzNGhxrx8Osn2jC9lGKeZmh6+HapAlVxXG
         3CnQ3Qhym19DbRjpVrcwv6vBQxb9/De4UDqadpEJ+nXqfVqsR6/GIthRs9q8uu6R7eiA
         KYLeQc75ebxrPIiTryCtVOXlhac5nVLt/KkXop7PCWtZPHObPDHXZAbWkoYmoaHWz8rP
         m6Rw==
X-Gm-Message-State: AOAM530HGf8WTutDKY5nJLpy26Kivy2eOmLtiG0zvUuiwM8DWJkq0WrP
	f7SKGO0gIQNrUzfBCTfiVFVmNg==
X-Google-Smtp-Source: ABdhPJyHMomXUUSsim9BNDKSfgWuXipYZG3PXU/QZcHRhPnPUWPnIYtsppjWSiGU4XA2AOeUZekwhg==
X-Received: by 2002:a05:6a00:230e:b029:3c4:24ff:969d with SMTP id h14-20020a056a00230eb02903c424ff969dmr8103456pfh.44.1629274780870;
        Wed, 18 Aug 2021 01:19:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r78sm5425224pfc.206.2021.08.18.01.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 01:19:40 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>,
	Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] staging: wlan-ng: Disable buggy MIB ioctl
Date: Wed, 18 Aug 2021 01:19:37 -0700
Message-Id: <20210818081937.1668775-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1567; h=from:subject; bh=Sgwjp53Pz70aIh4b/DDRu0OZ/4XXSmncmaDMLY4cqIw=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHMKY2ZE8JgxxJFeCq1C/wwUCKAJPO2ye+nyaVoJF tdhC7VeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRzCmAAKCRCJcvTf3G3AJjprD/ kBbBNMPslIY0OVULW5j/PMahglxJ5BZqHi3SutRyz4d20V/aFKmPQdgacFaghGdiyQRWXeGP13uAuw vXEt8OjGNW8fFgpZglspaLB0ZLiXyZJV06AwQycNuo6nTv0cAtR9aqTiz/QNabg1u/X16l1fuu6ORw pr8Cp4CQ55HnUInyKG/wEC1Fg0u76cAl/dM/eYBcOppW2DGf2Z1zYe8R1frBgg+FJExpD4C1462W5b gGPrBOSuUG+1YA/3S5frN5BzLvbom/0jKzKh04ROSFKygNvPyX4n4wMpwzDK78xEyRHl7nr3lah4u7 oEjvEwEj0jZgkpwejrRof67vD6pldQjYfgKynzFlHVvndWajkfIcEvqmTcc2yUaAiZcID557G+EhlM nvMpLxhHBk0k34mIg77w7islWTrtAblsHJFjXCBp9LDJMkyzvYH3p73dDyYCiCloY/noIFn8HceyVR 8CNPEmLZY1NaOgedSQx7v4dBeFrY6XPY6Ov1sD+6F8oUwt6XUoPUgWK5FOA7VdPBZuW9shxai5fm1X +GmcSB++9XWXnyHJgNoSit0m9Fd9Q5le1I+cowp218iEVtBHqNa4ysn74BFwaK94RFnIh3cQTFMH2R U/5nn3X2DZ4GLxYjV8flPH1NBF7FXRRC7G8K5jI/NFPQrEXzs6OTULkn0lhw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

struct hfa384x_wpa_data ends with a flexible array, but it is allocated
on the stack. This means it can never hold any data. Disable the
memcpy() calls in and out of the structure, since it must always be
zero. This could never have worked.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/staging/wlan-ng/prism2mib.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/wlan-ng/prism2mib.c b/drivers/staging/wlan-ng/prism2mib.c
index 875812a391c9..d14f032a7ed6 100644
--- a/drivers/staging/wlan-ng/prism2mib.c
+++ b/drivers/staging/wlan-ng/prism2mib.c
@@ -668,6 +668,10 @@ static int prism2mib_priv(struct mibrec *mib,
 
 	switch (mib->did) {
 	case DIDMIB_LNX_CONFIGTABLE_RSNAIE: {
+		/*
+		 * This can never work: wpa is on the stack
+		 * and has no bytes allocated in wpa.data.
+		 */
 		struct hfa384x_wpa_data wpa;
 
 		if (isget) {
@@ -675,11 +679,17 @@ static int prism2mib_priv(struct mibrec *mib,
 					       HFA384x_RID_CNFWPADATA,
 					       (u8 *)&wpa,
 					       sizeof(wpa));
+			/*
 			pstr->len = le16_to_cpu(wpa.datalen);
 			memcpy(pstr->data, wpa.data, pstr->len);
+			*/
+			pstr->len = 0;
 		} else {
+			/*
 			wpa.datalen = cpu_to_le16(pstr->len);
 			memcpy(wpa.data, pstr->data, pstr->len);
+			*/
+			wpa.datalen = 0;
 
 			hfa384x_drvr_setconfig(hw,
 					       HFA384x_RID_CNFWPADATA,
-- 
2.30.2

