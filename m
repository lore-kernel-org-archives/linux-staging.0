Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9247D364E90
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 13:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770039267; cv=none; b=M1SOhNiwdS0/3CcL5HcratSF0tF3AS1H0McgOj9SnT+jo6qFyPgTqZ1WT9UfI2E5AqEH5zgtpvfk/0F+bnpjk3eQhLGLtUzA8aSVmCNe+0H8XtJZeDZ3DPh5fl3Q6T33SMi6uVbhiQKqB5eau4qS8tcrtVH0xs4AExcCipnC3mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770039267; c=relaxed/simple;
	bh=2Rj3poYOE8IeSQv9rB3HQCoDi8Y5z8ljXD1lzaA+pak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cjuhIcUEMvAGaitIg0EvE+/4lZcYr+iZ2jkC0RA/MRTaeZjX75F2cL75H/1rrijQJvnSl0N0M1Z8g8j1+k/Asj7/AZ0wlZY7C2L6UOZ65iM14SbZomQDjUmvZGJ1LIDr98+5GeIqMsLeD7bo9J0Y87U8DtcC5EdF3NJZIZwgbq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqFNbjRU; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqFNbjRU"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b71557299dso4494294eec.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 05:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770039266; x=1770644066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WY67X0KCMt3a4eWMRDMrgXWjt/QCKf+tJboHjnqjZlc=;
        b=bqFNbjRUVMubZG8BlVWk4Tc/B34O3uA9EtRJbJk/0QoPfmfls/9Shj2ChXcb6w5reC
         olhY+DDK/SUXg4SYekvoWeE3YetcN49CJkWk2HIUSg44AQssZXz214Ky2JjxzkIE/5+f
         Bl30fWsEKtlpkWNjCRK7WcT4369R0hdDuRQRMX4AWCQJ5K3lzfnDDDOeGqKDRcEKWvb9
         iwNCk9/J4iu+IxASxwtLnCoP52hHZ0cATYRhoZRmrYUxmvlkNJMUV8c6bgvuHMbZuMj9
         C7t6esglBQ88ZGL8vQUEVt5glZ4kLWv4owEack6hqifeEZMO/klrqPrkaSb7ymPwOKt6
         ioeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770039266; x=1770644066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WY67X0KCMt3a4eWMRDMrgXWjt/QCKf+tJboHjnqjZlc=;
        b=Xqq2toB5DsJaxw2kakhKzPPybjjFhklGmfTcoxwvDZT6r1yJcrttdYOGinFCdGq831
         7Rad+q3c/vrxtjveAIqGeRV9BAkTEMBhC5m+525x7XmLsRgr50RroqVVjJgx/yJkSu7t
         GAY1abH3fPoGVHGmIl0oWGGHnGaIC3PD5NsCJ5QphOlqS2eBxv5ot3uhFJzLJyI96ALC
         aMRtNgMMquWq2ZeVpfTI/069urvL+S6NcAtjuvHUCoBAyeIOUcVS+xpHSw5v83XGKhTk
         TyPtYJ0kmCQvfFXfjKuRdW0WQc9CN391K6+sl+G+IdpS+tMY11pWblCj5K8Wn85TorGb
         bkug==
X-Forwarded-Encrypted: i=1; AJvYcCX1TLETuJ5SbFw6oQhENtPujnW/SpQj1CfcVVZJ8KPkPxyYBNjwjG1/qTSJyxTC90cKsYzboXhjW0Pu7Cp8@lists.linux.dev
X-Gm-Message-State: AOJu0YyxRadqxGBNBnhEHosEgiWIiUrIiKdPG00sAmAmFpZCn//onK+i
	pJWIcZJ4gmypchyZOv02cZadhO+i5u6CC/0ra6rA8GU0SbYlc0lwIUJh
X-Gm-Gg: AZuq6aIcONAOpKO+eHT2ix1GWCZk5cRuFp1Pv3XTX7zlWWh3vH8t5A9BS5Y3K0GBnwH
	SQmpksVn51Tn7m7YesLqnwVmMGbsPvGcgQDJV7gpl7YwCjQE12cy0XDS0mn9bVFm3uSoy4gtxN1
	2YDsVMWy+h6JWeeRZGmJLt1+nK554lNr7iQdRDA7uq9fGAgN3sTpAUoJKAZ66+0ie2zdkPdYTv5
	9wbRXawWEtjKA4ubq3bFwGU07S7vJLnQ/c0E8i43LltrghEPcodOqMe2I7FlciP88i6p3XG7UJM
	syr6gYOLcMXVyj1g7w3wM3lsc2CW5FLU50iORHQMh10ErzTfK7JWywaQSkDr4goOfQyeZIQzEfZ
	jpbIZpcVbKL+N9bJIjo9Gnya5ljFP2BzQeLR4LBOhdCmspuWnt0SMLQtfHBsooei3OTD8XuXcxp
	pQTb92grb0rbLc9cMbboWORi2kkQoWvGZi
X-Received: by 2002:a05:7301:1688:b0:2ae:526a:961d with SMTP id 5a478bee46e88-2b7c8941c2amr4134860eec.40.1770039265565;
        Mon, 02 Feb 2026 05:34:25 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af8a7bsm20097282eec.34.2026.02.02.05.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 05:34:25 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v5 0/2] staging: axis-fifo: refactor and cleanup
Date: Mon,  2 Feb 2026 10:34:17 -0300
Message-ID: <20260202133419.20112-1-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v5:
 - Added missing newline at the end of the file in Patch 2.

Changes in v4:
 - Removed extra blank lines in commit messages.
 - Added "rx" and "tx" prefixes to error messages in Patch 2.
 - Explicitly listed changes in individual patches.

Changes in v3:
 - Split into two patches as requested.

Gustavo Piaz da Silva (2):
  staging: axis-fifo: align fifo depth types with OF API
  staging: axis-fifo: refactor device tree parsing

 drivers/staging/axis-fifo/axis-fifo.c | 79 +++++++++------------------
 1 file changed, 26 insertions(+), 53 deletions(-)

-- 
2.52.0

