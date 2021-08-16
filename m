Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F866D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 16:06:28 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id b15so32655246ejg.10
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g5Y6A0GU/72isP5rG5oSxTpEZ8IT0eu5BzylQB0NEgo=;
        b=dCBYpk7vsKoZhZF5PishaJyN4S0IUzseuLE42M1c2jBoCF4Rk+XXoBG14KRzYVTNQW
         7RANosXFNY6DMX8f2At7e68LaeDqX391WDkvtKFrbJOA9o3Whxu5Y442dMvX0Pn8Eer/
         ep+pTBgvygsE7IL/Fq1Aw+/f27M+In42QYTenCqKP3ekxqDlTlCZfGb3F0PnJGXAyBsf
         IzBSPwcAJbNRKGG7C531HjB4RtnaG6VTMFMoeL4CBAo8syvExZqaASVkAYTFtr0jL+i4
         jkuOUE0qJup9CInfUMr36APEn4MMoaDTcVXKQ+i3k36z6YCY8Zdy5uQZXO4v679EvUDg
         yqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g5Y6A0GU/72isP5rG5oSxTpEZ8IT0eu5BzylQB0NEgo=;
        b=e8It+GiDOWEdogIw4jt0XlZkyfBCeqI/Ag6PnC6nf/TLCGxqyrppcRNxwnYb1iSs62
         j8k08uypSJ7hrXJdS6llG+urMWjCNBmJVa4FTuUniBQJ5jitD2YCY1lT3nsXOdKVBWLA
         3OupKPWLhU9nJbslF9YQ6zrHMLhgBx8oit/cVOJ57wMVKuWOStai2fiV6/mMWVRtntuW
         F8AT31LJ4+lF1rs1svWH+HXKN07LmNnCo9ETQr/UvAI2jX3vJzPD8tpQRIpQkXR8qu8P
         y+joVWp9i4vuvI1ko71ZEpLwJaRBefeUAKiptPR9ziOpob4c/sYfrNbwSx5ONYwPfhg/
         Ngew==
X-Gm-Message-State: AOAM5312W+dyiYFP95cigribo9HCqo5Y+sCNuYZK9nM8vLk2vXQFlClT
	Ro0RU1y1lVm/bULTUTzLHu0=
X-Google-Smtp-Source: ABdhPJxT4vY1P7PhIfE1isHn7chFWUyVdwauFffB2VnVSIouc941eX4DdLMQSiNvoRbVVZyBwq5/HQ==
X-Received: by 2002:a17:906:4c89:: with SMTP id q9mr16785672eju.118.1629129986980;
        Mon, 16 Aug 2021 09:06:26 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
        by smtp.gmail.com with ESMTPSA id s18sm3906239ejh.12.2021.08.16.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 09:06:26 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Martin Kaiser <martin@kaiser.cx>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: Remove code depending on NAT25_LOOKUP
Date: Mon, 16 Aug 2021 18:06:16 +0200
Message-Id: <20210816160617.11949-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816160617.11949-1-fmdefrancesco@gmail.com>
References: <20210816160617.11949-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all the code related to the management of the NAT25_LOOKUP
method in nat25_db_handle(). The only function that used that method was
the now deleted nat25_handle_frame(). Remove the NAT25_LOOKUP entry from
the NAT25_METHOD enum because it is not anymore used everywhere else in
the code of the driver.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c    | 150 -------------------
 drivers/staging/r8188eu/include/rtw_br_ext.h |   1 -
 2 files changed, 151 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 5035f354081f..5b032406e9d3 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -515,27 +515,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 
 			__nat25_db_print(priv);
 			return 0;
-		case NAT25_LOOKUP:
-			DEBUG_INFO("NAT25: Lookup IP, SA =%08x, DA =%08x\n", iph->saddr, iph->daddr);
-			tmp = be32_to_cpu(iph->daddr);
-			__nat25_generate_ipv4_network_addr(networkAddr, &tmp);
-
-			if (!__nat25_db_network_lookup_and_replace(priv, skb, networkAddr)) {
-				if (*((unsigned char *)&iph->daddr + 3) == 0xff) {
-					/*  L2 is unicast but L3 is broadcast, make L2 bacome broadcast */
-					DEBUG_INFO("NAT25: Set DA as boardcast\n");
-					memset(skb->data, 0xff, ETH_ALEN);
-				} else {
-					/*  forward unknow IP packet to upper TCP/IP */
-					DEBUG_INFO("NAT25: Replace DA with BR's MAC\n");
-					if ((*(u32 *)priv->br_mac) == 0 && (*(u16 *)(priv->br_mac+4)) == 0) {
-						printk("Re-init netdev_br_init() due to br_mac == 0!\n");
-						netdev_br_init(priv->pnetdev);
-					}
-					memcpy(skb->data, priv->br_mac, ETH_ALEN);
-				}
-			}
-			return 0;
 		default:
 			return -1;
 		}
@@ -567,20 +546,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
 			__nat25_db_print(priv);
 			return 0;
-		case NAT25_LOOKUP:
-			DEBUG_INFO("NAT25: Lookup ARP\n");
-
-			arp_ptr += arp->ar_hln;
-			sender = (unsigned int *)arp_ptr;
-			arp_ptr += (arp->ar_hln + arp->ar_pln);
-			target = (unsigned int *)arp_ptr;
-			__nat25_generate_ipv4_network_addr(networkAddr, target);
-			__nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
-			/*  change to ARP target mac address to Lookup result */
-			arp_ptr = (unsigned char *)(arp + 1);
-			arp_ptr += (arp->ar_hln + arp->ar_pln);
-			memcpy(arp_ptr, skb->data, ETH_ALEN);
-			return 0;
 		default:
 			return -1;
 		}
@@ -687,22 +652,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 				__nat25_db_network_insert(priv, skb->data+ETH_ALEN, networkAddr);
 				__nat25_db_print(priv);
 				return 0;
-			case NAT25_LOOKUP:
-				if (!memcmp(GET_MY_HWADDR(priv), ipx->ipx_dest.node, ETH_ALEN)) {
-					DEBUG_INFO("NAT25: Lookup IPX, Modify Destination IPX Node addr\n");
-
-					__nat25_generate_ipx_network_addr_with_socket(networkAddr, &ipx->ipx_dest.net, &ipx->ipx_dest.sock);
-
-					__nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
-
-					/*  replace IPX destination node addr with Lookup destination MAC addr */
-					memcpy(ipx->ipx_dest.node, skb->data, ETH_ALEN);
-				} else {
-					__nat25_generate_ipx_network_addr_with_node(networkAddr, &ipx->ipx_dest.net, ipx->ipx_dest.node);
-
-					__nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
-				}
-				return 0;
 			default:
 				return -1;
 			}
@@ -732,19 +681,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 
 				__nat25_db_print(priv);
 				return 0;
-			case NAT25_LOOKUP:
-				DEBUG_INFO("NAT25: Lookup AARP, Source =%d,%d Destination =%d,%d\n",
-					ea->pa_src_net,
-					ea->pa_src_node,
-					ea->pa_dst_net,
-					ea->pa_dst_node);
-
-				__nat25_generate_apple_network_addr(networkAddr, &ea->pa_dst_net, &ea->pa_dst_node);
-
-				__nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
-
-				/*  change to AARP destination mac address to Lookup result */
-				memcpy(ea->hw_dst, skb->data, ETH_ALEN);
 				return 0;
 			default:
 				return -1;
@@ -766,15 +702,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 
 				__nat25_db_print(priv);
 				return 0;
-			case NAT25_LOOKUP:
-				DEBUG_INFO("NAT25: Lookup DDP, Source =%d,%d Destination =%d,%d\n",
-					ddp->deh_snet,
-					ddp->deh_snode,
-					ddp->deh_dnet,
-					ddp->deh_dnode);
-				__nat25_generate_apple_network_addr(networkAddr, &ddp->deh_dnet, &ddp->deh_dnode);
-				__nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
-				return 0;
 			default:
 				return -1;
 			}
@@ -865,70 +792,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 					priv->pppoe_connection_in_progress = 0;
 			}
 			return 0;
-		case NAT25_LOOKUP:
-			if (ph->code == PADO_CODE || ph->code == PADS_CODE) {
-				if (priv->ethBrExtInfo.addPPPoETag) {
-					struct pppoe_tag *tag;
-					unsigned char *ptr;
-					unsigned short tagType, tagLen;
-					int offset = 0;
-
-					ptr = __nat25_find_pppoe_tag(ph, ntohs(PTT_RELAY_SID));
-					if (!ptr) {
-						DEBUG_ERR("Fail to find PTT_RELAY_SID in FADO!\n");
-						return -1;
-					}
-
-					tag = (struct pppoe_tag *)ptr;
-					tagType = (unsigned short)((ptr[0] << 8) + ptr[1]);
-					tagLen = (unsigned short)((ptr[2] << 8) + ptr[3]);
-
-					if ((tagType != ntohs(PTT_RELAY_SID)) || (tagLen < (MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN))) {
-						DEBUG_ERR("Invalid PTT_RELAY_SID tag length [%d]!\n", tagLen);
-						return -1;
-					}
-
-					pMagic = (unsigned short *)tag->tag_data;
-					if (ntohs(*pMagic) != MAGIC_CODE) {
-						DEBUG_ERR("Can't find MAGIC_CODE in %s packet!\n",
-							(ph->code == PADO_CODE ? "PADO" : "PADS"));
-						return -1;
-					}
-
-					memcpy(skb->data, tag->tag_data+MAGIC_CODE_LEN, ETH_ALEN);
-
-					if (tagLen > MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN)
-						offset = TAG_HDR_LEN;
-
-					if (skb_pull_and_merge(skb, ptr+offset, TAG_HDR_LEN+MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN-offset) < 0) {
-						DEBUG_ERR("call skb_pull_and_merge() failed in PADO packet!\n");
-						return -1;
-					}
-					ph->length = htons(ntohs(ph->length)-(TAG_HDR_LEN+MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN-offset));
-					if (offset > 0)
-						tag->tag_len = htons(tagLen-MAGIC_CODE_LEN-RTL_RELAY_TAG_LEN);
-
-					DEBUG_INFO("NAT25: Lookup PPPoE, forward %s Packet from %s\n",
-						(ph->code == PADO_CODE ? "PADO" : "PADS"),	skb->dev->name);
-				} else { /*  not add relay tag */
-					if (!priv->pppoe_connection_in_progress) {
-						DEBUG_ERR("Discard PPPoE packet due to no connection in progresss!\n");
-						return -1;
-					}
-					memcpy(skb->data, priv->pppoe_addr, ETH_ALEN);
-					priv->pppoe_connection_in_progress = WAIT_TIME_PPPOE;
-				}
-			} else {
-				if (ph->sid != 0) {
-					DEBUG_INFO("NAT25: Lookup PPPoE, lookup session packet from %s\n", skb->dev->name);
-					__nat25_generate_pppoe_network_addr(networkAddr, skb->data+ETH_ALEN, &ph->sid);
-					__nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
-					__nat25_db_print(priv);
-				} else {
-					return -1;
-				}
-			}
-			return 0;
 		default:
 			return -1;
 		}
@@ -941,8 +804,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			return -1;
 		case NAT25_INSERT:
 			return 0;
-		case NAT25_LOOKUP:
-			return 0;
 		default:
 			return -1;
 		}
@@ -955,8 +816,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 			return -1;
 		case NAT25_INSERT:
 			return 0;
-		case NAT25_LOOKUP:
-			return 0;
 		default:
 			return -1;
 		}
@@ -1003,15 +862,6 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 				}
 			}
 			return 0;
-		case NAT25_LOOKUP:
-			DEBUG_INFO("NAT25: Lookup IP, SA =%4x:%4x:%4x:%4x:%4x:%4x:%4x:%4x, DA =%4x:%4x:%4x:%4x:%4x:%4x:%4x:%4x\n",
-				   iph->saddr.s6_addr16[0], iph->saddr.s6_addr16[1], iph->saddr.s6_addr16[2], iph->saddr.s6_addr16[3],
-				   iph->saddr.s6_addr16[4], iph->saddr.s6_addr16[5], iph->saddr.s6_addr16[6], iph->saddr.s6_addr16[7],
-				   iph->daddr.s6_addr16[0], iph->daddr.s6_addr16[1], iph->daddr.s6_addr16[2], iph->daddr.s6_addr16[3],
-				   iph->daddr.s6_addr16[4], iph->daddr.s6_addr16[5], iph->daddr.s6_addr16[6], iph->daddr.s6_addr16[7]);
-			__nat25_generate_ipv6_network_addr(networkAddr, (unsigned int *)&iph->daddr);
-			__nat25_db_network_lookup_and_replace(priv, skb, networkAddr);
-			return 0;
 		default:
 			return -1;
 		}
diff --git a/drivers/staging/r8188eu/include/rtw_br_ext.h b/drivers/staging/r8188eu/include/rtw_br_ext.h
index 00d461c4c6fa..69905d30c191 100644
--- a/drivers/staging/r8188eu/include/rtw_br_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_br_ext.h
@@ -31,7 +31,6 @@ enum NAT25_METHOD {
 	NAT25_MIN,
 	NAT25_CHECK,
 	NAT25_INSERT,
-	NAT25_LOOKUP,
 	NAT25_PARSE,
 	NAT25_MAX
 };
-- 
2.32.0

