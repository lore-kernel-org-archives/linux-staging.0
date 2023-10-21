Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB8B626
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 00:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLxL0cs+"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5079f9ec8d9so1619356e87.0
        for <linux-staging@lists.linux.dev>; Fri, 20 Oct 2023 17:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697846638; x=1698451438; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3QOt+Zgd2/WO0G0wH+oMWkyPIIiY/39bwhMnXAR6G4=;
        b=kLxL0cs+b4cfAPmpbXZMgUwOOdPCRGvWU6OtH5jh7NbYn+0xwA9ORZCZxdUkYZ1TUf
         DdFRRkVQ4hIJqC2WUIOrLiLauVm/fideK46uBcdv8q9V733TUQH7yMQUVmkQlMjJF3gz
         L7lgey4KsDcIg8rEzzOuz7DFq8y9Bevg22hvhjfVXSzd6m4m0KbxusWSBrrAISv4zS7M
         gskbPIfCYQ83rVnbz67KFL7Fyzo1GQWRwDvRr7KpI3wFBsUB/jqIRT3N19oK6daqq9a0
         Q7vdhTGawBxdPZUPY7VH5i2hw+DgXBbcwJwme8IyQyEwukgzf87I4v8NeOfFcx9VvnmE
         2lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697846638; x=1698451438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3QOt+Zgd2/WO0G0wH+oMWkyPIIiY/39bwhMnXAR6G4=;
        b=tXPBNnBT24ao71ljwjYRjibQ+ig+ErmEIlP6Hx98WxATMEoZXnAKLRPrCqndlwoerg
         I3cP1WY3BlRFKbQ7nyhRyjoSmjiHWzEDAZORmCqTahBfFXDcZQLg4zkNGk1t84dXZ/u1
         9qDSSou9S57tldq3aqC6TxVUcuN+iNYkpZdF8gUaXO2RAXzTl+R2nVEuV9bUN1CyAwyQ
         b/yLnnGebr3pOMaSZ7G2FHsaZIY1WCE/qjYhPXK/Y9CgZ+QvOeINKLweNeWoi1NJaYcu
         6dKIjHdQDlal2b4CHrF6zqG8ZgDyo/koI9IEjCD8Hbj2+oSfjJ7lgk1OlKaDb7KshGn5
         66tg==
X-Gm-Message-State: AOJu0Yzi9phIzznPZybBV/LMYQcQpe3RGotcSzbP6VgmqwKnqccF1ZZ8
	i2lcSIOc0RisHwbGfMAn3UE=
X-Google-Smtp-Source: AGHT+IHmQfVR+6oJ35CKxqhWsV1GQHCSuiO/Aj3kUxDOOOv5UnkYEtXpDFc6iKuLqKMVppxjWqdJhA==
X-Received: by 2002:a05:6512:10c8:b0:504:567a:19a7 with SMTP id k8-20020a05651210c800b00504567a19a7mr2085249lfg.2.1697846637526;
        Fri, 20 Oct 2023 17:03:57 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id n13-20020ac242cd000000b00507ce48e283sm595463lfl.206.2023.10.20.17.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 17:03:57 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 2/2] staging: octeon: Fix remaining instances affected by removal of typedefs
Date: Sat, 21 Oct 2023 02:03:40 +0200
Message-Id: <20231021000340.56889-3-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231021000340.56889-1-bergh.jonathan@gmail.com>
References: <20231021000340.56889-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the remaining instances in ethernet.c file affected by removal 
of the typedefs from octeon-stubs.h

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 9eee28f2940c..8e1f4b987a25 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -201,8 +201,8 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
-	cvmx_pip_port_status_t rx_status;
-	cvmx_pko_port_status_t tx_status;
+	struct cvmx_pip_port_status rx_status;
+	struct cvmx_pko_port_status tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
 	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
@@ -798,7 +798,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
-		cvmx_helper_interface_mode_t imode =
+		enum cvmx_helper_interface_mode imode =
 		    cvmx_helper_interface_get_mode(interface);
 		int num_ports = cvmx_helper_ports_on_interface(interface);
 		int port;
-- 
2.40.1

